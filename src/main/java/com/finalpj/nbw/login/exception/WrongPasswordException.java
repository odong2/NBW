package com.finalpj.nbw.login.exception;

public class WrongPasswordException extends LoginException {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WrongPasswordException() {
        super();
    }
	
    public WrongPasswordException(String message) {
        super(message);
    }
}
