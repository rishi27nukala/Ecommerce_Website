package bean;

public class UserDetails {
	private int id;
	private String email;
	private String password;
	private String role;
	
	public UserDetails() {
	}


	public UserDetails(int id,String email, String password) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.role = role;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}



	public String toString() {
		return "UserDetails [id=" + id + ", email=" + email + ", password=" + password + ", role=" + role + "]";
	}

}
