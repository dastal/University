package ch.uzh.ifi.seal.soprafs19.controller;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.AuthorizationCredentials;
import ch.uzh.ifi.seal.soprafs19.dto.incoming.LoginCredentials;
import ch.uzh.ifi.seal.soprafs19.dto.outgoing.UserDetailDto;
import ch.uzh.ifi.seal.soprafs19.entity.User;
import ch.uzh.ifi.seal.soprafs19.service.AuthorizationService;
import ch.uzh.ifi.seal.soprafs19.service.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;



@RestController
public class UserController {

    private final UserService service;

    private final AuthorizationService authService;

    private DashboardController dashboardController;

    @Autowired
    private ModelMapper modelMapper;

    UserController(UserService service, DashboardController dashboardController, AuthorizationService authorizationService) {
        this.service = service;
        this.dashboardController = dashboardController;
        this.authService = authorizationService;
    }

    @GetMapping("/users/{id}")
    UserDetailDto one(@PathVariable String id,  @RequestParam() String token) {
        authService.authorize(token);
        return modelMapper.map(service.getUser(id), UserDetailDto.class);
    }

    @CrossOrigin
    @PutMapping("/users/{id}")
    ResponseEntity update(@PathVariable String id, @RequestBody User updateUser, @RequestParam() String token) {
        this.service.updateUser(id, updateUser, token);
        this.dashboardController.publishUsers();
        return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
    }

    @ResponseStatus(HttpStatus.OK)
    @PostMapping("/users/login")
    AuthorizationCredentials login(@RequestBody LoginCredentials cred) {
        AuthorizationCredentials acred = new AuthorizationCredentials();
        User local;
        local = this.service.loginUser(cred.getUsername(), cred.getPassword());

        acred.setToken(local.getToken());
        acred.setId(local.getId());
        this.dashboardController.publishUsers();
        return acred;
    }

    @PostMapping("/users/logout")
    @ResponseStatus(HttpStatus.OK)
    String logout(@RequestBody AuthorizationCredentials cred) {
        String log = this.service.logoutUser(cred.getToken());
        this.dashboardController.publishUsers();
        return log;
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/users")
    String createUser(@RequestBody User newUser, HttpServletRequest request) throws UnknownHostException {
        User local = this.service.createUser(newUser);
        String host = InetAddress.getLocalHost().getHostAddress();
        this.dashboardController.publishUsers();
        return String.format("http://%s:%s/users/%s", host, request.getLocalPort(), local.getId());
    }

}