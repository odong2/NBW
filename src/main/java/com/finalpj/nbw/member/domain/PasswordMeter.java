package com.finalpj.nbw.member.domain;

import org.springframework.stereotype.Service;

@Service
public class PasswordMeter {

    public PasswordStrength meter(String pw){

        /* pw가 null 일 경우, 그리고 ""빈값인 경우 IllegalArgumentException 을 던져준다. */
        if (pw == null || pw.isEmpty()) throw new IllegalArgumentException();

        /* 충족하는 개수 */
        int metCount = 0;
        // 길이규칙을 충족하면 충족 개수 +1
        if(pw.length()>=8) metCount++;
        // 대문자규칙 충족
        if(containsUppercase(pw)) metCount++;
        // 숫자규칙 충족
        if(containsNumber(pw)) metCount++;

        /* 충족 개수가 하나면 WEAK */
        if(metCount == 1 || metCount == 0) return PasswordStrength.WEAK;

        /* 충족 개수가 두개면 NORMAL */
        if(metCount == 2) return PasswordStrength.NORMAL;

        return PasswordStrength.STRONG;
    }

    private boolean containsNumber(String pw) {
        boolean isFoundNumber = false;
        /* 대문자가 포함되어 있다면 true */
        for(char ch : pw.toCharArray()){
            if (ch >= '0' && ch <= '9') {
                isFoundNumber = true;
                break;
            }
        }
        return isFoundNumber;
    }

    private boolean containsUppercase(String pw){
        boolean isFoundUppercase = false;
        /* 대문자가 포함되어 있다면 true */
        for(char ch : pw.toCharArray()){
            if (ch >= 'A' && ch <= 'Z') {
                isFoundUppercase = true;
                break;
            }
        }
        return isFoundUppercase;
    }
}
