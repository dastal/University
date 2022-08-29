package ch.uzh.ifi.seal.soprafs19.service;

import ch.uzh.ifi.seal.soprafs19.controller.DashboardController;
import ch.uzh.ifi.seal.soprafs19.controller.LobbyController;
import ch.uzh.ifi.seal.soprafs19.repository.LobbyContextRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
public class AccessHelper {
    private static LobbyController lobbyController;

    public static LobbyController getLobbyController() {
        return lobbyController;
    }

    public static UserService getUserService() {
        return userService;
    }

    public static LobbyService getLobbyService() {
        return lobbyService;
    }

    public static LobbyContextRepository getLobbyContextRepository() {
        return lobbyContextRepository;
    }

    public static DashboardController getDashboardController() {
        return dashboardController;
    }

    @Autowired
    public void setLobbyController(LobbyController lobbyController) {
        AccessHelper.lobbyController = lobbyController;
    }

    private static UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        AccessHelper.userService = userService;
    }

    private static LobbyService lobbyService;

    @Autowired
    public void setLobbyService(LobbyService lobbyService) {
        AccessHelper.lobbyService = lobbyService;
    }

    private static LobbyContextRepository lobbyContextRepository;

    @Autowired
    public void setLobbyContextRepository(@Qualifier("lobbyContextRepository")LobbyContextRepository lobbyContextRepository) {
        AccessHelper.lobbyContextRepository = lobbyContextRepository;
    }

    private static DashboardController dashboardController;

    @Autowired
    public void setDashboardController(DashboardController dashboardController) {
        AccessHelper.dashboardController = dashboardController;
    }
}
