package com.finalpj.nbw.login.exception;

public class WrongIdException extends LoginException {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WrongIdException() {
        super();
    }
	
    public WrongIdException(String message) {
        super(message);
    }
}
