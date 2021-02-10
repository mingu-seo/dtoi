package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator {

	private String cst_id;
	private String cst_pwd;

	public MailAuthenticator(String cst_id, String cst_pwd){
		this.cst_id = cst_id;
		this.cst_pwd = cst_pwd;
	}
	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(cst_id, cst_pwd);
	}

}
