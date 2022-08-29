package ch.uzh.ifi.seal.soprafs19.service.EndpointTests;

import ch.uzh.ifi.seal.soprafs19.dto.incoming.AuthorizationCredentials;
import org.json.JSONObject;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class UserControllerTest {

    @LocalServerPort
    private int port;

    @Autowired
    private TestRestTemplate restTemplate;

    private String getBaseUrl() {
        return "http://localhost:" + port;
    }

    @Test
    public void testCreateUser() {
        Map<String, String> testUser = new HashMap<>();
        testUser.put("name", "testNames");
        testUser.put("username", "testUsernames");
        testUser.put("password", "12345");
        testUser.put("birthDay", "946681200000");

        String response = restTemplate.postForEntity(getBaseUrl() + "/users", testUser, String.class).getStatusCode().toString();
        Assert.assertEquals(HttpStatus.CREATED.toString(), response);
    }

    @Test
    public void testCreateUserAgain() {
        Map<String, String> testUser = new HashMap<>();
        new JSONObject(testUser);
        testUser.put("name", "testName");
        testUser.put("username", "testUsername1");
        testUser.put("password", "1234");
        testUser.put("birthDay", "946681200000");

        restTemplate.postForEntity(getBaseUrl() + "/users", testUser, String.class);

        Map<String, String> testUser1 = new HashMap<>();
        testUser1.put("name", "testName");
        testUser1.put("username", "testUsername1");
        testUser1.put("password", "1234");
        testUser1.put("birthDay", "946681200000");

        String response = restTemplate.postForEntity(getBaseUrl() + "/users", testUser1, String.class).getStatusCode().toString();
        Assert.assertEquals(HttpStatus.CONFLICT.toString(), response);
    }

    @Test
    public void addUser() {
        Map<String, String> testUser = new HashMap<>();
        testUser.put("name", "testName");
        testUser.put("username", "testUsername");
        testUser.put("password", "1234");
        testUser.put("birthDay", "946681200000");

        String response = restTemplate.postForEntity(getBaseUrl() + "/users", testUser, String.class).getStatusCode().toString();
        Assert.assertEquals(HttpStatus.CREATED.toString(), response);
    }

    @Test
    public void updateUserWithCorrectId() {
        Map<String, String> testUser = new HashMap<>();
        testUser.put("name", "testName");
        testUser.put("username", "testUsername");
        testUser.put("password", "1234");
        testUser.put("birthDay", "946681200000");

        restTemplate.postForEntity(getBaseUrl() + "/users", testUser, String.class);

        Map<String, String> cred = new HashMap<>();
        cred.put("username", "testUsername");
        cred.put("password", "1234");

        ResponseEntity<AuthorizationCredentials> responseLogin = restTemplate.postForEntity(getBaseUrl() + "/users/login", cred, AuthorizationCredentials.class);
        Assert.assertEquals(responseLogin.getStatusCode(), HttpStatus.OK);
        String testUserToken = responseLogin.getBody().getToken();
        String testUserId = responseLogin.getBody().getId().toString();

        Map<String, String> updateUser = new HashMap<>();
        updateUser.put("name", "testName");
        updateUser.put("username", "updateUsername");
        updateUser.put("password", "1234");
        updateUser.put("birthDay", "946681200000");

        RequestEntity<Map<String, String>> request =  RequestEntity
                .put(URI.create(getBaseUrl() + "/users/" + testUserId + "?token=" + testUserToken))
                .body(updateUser);
        ResponseEntity<Object> responseUpdate = restTemplate.exchange(request, Object.class);
        Assert.assertEquals(HttpStatus.NO_CONTENT, responseUpdate.getStatusCode());
    }

    @Test
    public void loginUser() {
        Map<String, String> testUserLogin = new HashMap<>();
        testUserLogin.put("name", "testName");
        testUserLogin.put("username", "testUsernameLogin");
        testUserLogin.put("password", "1234");
        testUserLogin.put("birthDay", "946681200000");

        restTemplate.postForEntity(getBaseUrl() + "/users", testUserLogin, String.class).getStatusCode().toString();

        Map<String, String> cred = new HashMap<>();
        cred.put("username", "testUsernameLogin");
        cred.put("password", "1234");

        String response = restTemplate.postForEntity(getBaseUrl() + "/users/login", cred, String.class).getStatusCode().toString();
        Assert.assertEquals(HttpStatus.OK.toString(), response);
    }

    @Test
    public void logoutUser() {
        Map<String, String> testUserLogout = new HashMap<>();
        testUserLogout.put("name", "testName");
        testUserLogout.put("username", "testUsernameLogout");
        testUserLogout.put("password", "1234");
        testUserLogout.put("birthDay", "946681200000");

        HttpStatus code = restTemplate.postForEntity(getBaseUrl() + "/users", testUserLogout, String.class).getStatusCode();
        Assert.assertEquals(HttpStatus.CREATED, code);

        Map<String, String> cred = new HashMap<>();
        cred.put("username", "testUsernameLogout");
        cred.put("password", "1234");

        ResponseEntity<AuthorizationCredentials> response = restTemplate.postForEntity(getBaseUrl() + "/users/login", cred, AuthorizationCredentials.class);
        code = response.getStatusCode();
        AuthorizationCredentials authorizationCredentials = response.getBody();
        Assert.assertEquals(HttpStatus.OK, code);

        code = restTemplate.postForEntity(getBaseUrl() + "/users/logout", authorizationCredentials, String.class).getStatusCode();
        Assert.assertEquals(HttpStatus.OK, code);
    }
}