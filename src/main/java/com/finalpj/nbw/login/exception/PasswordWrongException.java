package com.finalpj.nbw.login.exception;

public class PasswordWrongException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

    public PasswordWrongException() {
        super();
    }
	
    public PasswordWrongException(String message) {
        super(message);
    }
}
