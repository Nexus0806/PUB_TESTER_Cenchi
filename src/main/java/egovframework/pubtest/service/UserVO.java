
package egovframework.pubtest.service;

public class UserVO {
    // 회원 정보
    private String name;
    private String email;
    private String password;

    // 체험단 정보
    private String expId;
    private String title;
    private String content;
    private String regDate;

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getExpId() { return expId; }
    public void setExpId(String expId) { this.expId = expId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getRegDate() { return regDate; }
    public void setRegDate(String regDate) { this.regDate = regDate; }
}
