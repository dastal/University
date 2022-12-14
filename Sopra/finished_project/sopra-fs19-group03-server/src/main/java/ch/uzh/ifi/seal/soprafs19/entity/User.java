package ch.uzh.ifi.seal.soprafs19.entity;

import ch.uzh.ifi.seal.soprafs19.constant.UserStatus;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@JsonIgnoreProperties(value={"password", "token", "playerId", "lobbyToken"}, allowSetters = true)
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;
	
	@Column(nullable = false)
	private String name;
	
	@Column(nullable = false, unique = true)
	private String username;
	
	@Column(unique = true)
	@JsonProperty("token")
	private String token;

	@Column(nullable = false)
	private UserStatus status;

	@Column(nullable = false)
	@JsonProperty("password")
	private String password;

	@Column(nullable = false)
	private String creationDate;

	@Column
	private String birthDay;

	@Column
	@JsonProperty("lobbyToken")
	private String lobbyToken;

	@Column
	private Integer wins;

	private Integer games;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ruleset_id", referencedColumnName = "id")
	private Ruleset ruleset;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public UserStatus getStatus() {
		return status;
	}

	public void setStatus(UserStatus status) {
		this.status = status;
	}

	public String getPassword() {return password;}

	public void setPassword(String password) {this.password = password;}

	public void setCreationDate(String creationDate) {this.creationDate = creationDate;}

	public String getCreationDate() {return creationDate; }

	public String getBirthDay(){ return birthDay; }

	public void setBirthDay(String birthDay) {this.birthDay = birthDay;}

	public Integer getWins() {
		return wins;
	}

	public void setWins(Integer wins) {
		this.wins = wins;
	}

	public String getLobbyToken() {
		return lobbyToken;
	}

	public void setLobbyToken(String lobbyToken) {
		this.lobbyToken = lobbyToken;
	}

	@Override
	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof User)) {
			return false;
		}
		User user = (User) o;
		return this.getId().equals(user.getId());
	}

	@Override
	public int hashCode() {
		int result = 17;
		result = 31 * result + username.hashCode();
		result = 31 * result + id.hashCode();
		result = 31 * result + password.hashCode();
		return result;
	}

	public Ruleset getRuleset() {
		return ruleset;
	}

	public void setRuleset(Ruleset ruleset) {
		this.ruleset = ruleset;
	}

	public Integer getGames() {
		return games;
	}

	public void setGames(Integer games) {
		this.games = games;
	}
}



