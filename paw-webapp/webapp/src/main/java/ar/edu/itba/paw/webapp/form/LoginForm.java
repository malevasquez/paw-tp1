package ar.edu.itba.paw.webapp.form;

import ar.edu.itba.paw.webapp.validators.CheckPassword;
import ar.edu.itba.paw.webapp.validators.NotExistingEmail;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Size;

public class LoginForm {

    @NotEmpty
    @Email
    @NotExistingEmail
    @Size(max=100)
    private String email;

    @Size(min = 6, max = 20)
//    @CheckPassword
    private String password;

    private Boolean remember_me;

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

    public Boolean getRemember_me() {
        return remember_me;
    }

    public void setRemember_me(Boolean remember_me) {
        this.remember_me = remember_me;
    }


}
