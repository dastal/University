package ch.uzh.ifi.seal.soprafs19.controller;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.LobbyCredentials;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.LobbyContextDashboardDto;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.UserDto;
import ch.uzh.ifi.seal.soprafs19.entity.LobbyContext;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.service.LobbyService;
import ch.uzh.ifi.seal.soprafs19.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class DashboardController {
    private SimpMessagingTemplate  template;

    @Autowired
    private  LobbyService serviceLobby;

    @Autowired
    private  UserService serviceUser;

    @Autowired
    private ModelMapper modelMapper;

    DashboardController(LobbyService serviceLobby, UserService serviceUser, SimpMessagingTemplate template) {
        this.serviceLobby = serviceLobby;
        this.serviceUser = serviceUser;
        this.template = template;
    }

    public void publishLobbies() {
        this.template.convertAndSend("/topic/dashboard/lobbies", getAllLobbyDtos());
    }

    @SubscribeMapping("/dashboard/lobbies")
    protected Iterable subscribeLobbies() {
        return getAllLobbyDtos();
    }

    public void publishUsers() {
        this.template.convertAndSend("/topic/dashboard/users", getAllUsersDtos());
    }

    @SubscribeMapping("/dashboard/users")
    protected Iterable subscribeUsers() {
        return getAllUsersDtos();
    }

    private Iterable getAllUsersDtos() {
        List<User> users = serviceUser.getUsers();
        return users.stream().map(user -> modelMapper.map(user, UserDto.class)).collect(Collectors.toList());
    }

    private LobbyContextDashboardDto convertToDashboardDto(LobbyContext lobby) {
        LobbyContextDashboardDto lobbyDto = modelMapper.map(lobby, LobbyContextDashboardDto.class);
        lobbyDto.setUserCount(lobby.getUsers());
        return lobbyDto;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/dashboard/lobbies")
    @ResponseBody String createlobby(@RequestBody LobbyCredentials data){
        String lobbyToken = serviceLobby.createLobby(data.getToken(), data.getMode());
        publishLobbies();
        return lobbyToken;
    }

    private Iterable getAllLobbyDtos(){
        List<LobbyContext> lobbies = serviceLobby.getOpenLobbies();
        return lobbies.stream().map(lobby -> convertToDashboardDto(lobby)).collect(Collectors.toList());
    }

}


