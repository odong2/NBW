package com.finalpj.nbw.member.domain;

import org.junit.Test;

import static org.junit.Assert.*;

public class PasswordMeterTest {
    private PasswordMeter passwordMeter = new PasswordMeter();

    public void assertPasswordStrength(String password, PasswordStrength expected){
        /* 기대값 : meter 메서드가 파라미터로 받은 비밀번호의 안전도를 판단해서 리턴한 값
         * 실제값 : PasswordStrength 의 STRONG 수준  */
        PasswordStrength result = passwordMeter.meter(password);
        assertEquals(result, expected);
    }


    /* null 값이면 예외 발생 */
    @Test(expected = IllegalArgumentException.class)
    public void nullInput_IllegalArgumentException발생(){
        passwordMeter.meter(null);
    }

    /* 빈 값이면 예외 발생 */
    @Test(expected = IllegalArgumentException.class)
    public void emptyInput_IllegalArgumentException발생(){
        passwordMeter.meter("");
    }

    /* 모든 조건을 충족하는 경우 ===> 안전도 수준 : 강함 */
    @Test
    public void meetAllRules(){
        assertPasswordStrength("co1sl1qK1", PasswordStrength.STRONG);
        assertPasswordStrength("ABC123abc", PasswordStrength.STRONG);
    }

    /* 보통 : 길이가 8글자 이상이고 숫자와 소문자로만 이루어져 있다. */
    @Test
    public void noMeetUpper(){
        assertPasswordStrength("abc12345", PasswordStrength.NORMAL);
        assertPasswordStrength("abcd12345db", PasswordStrength.NORMAL);
    }

    /* 보통 : 길이가 8글자 이상이고 소문자와 대문자로만 이루어져 있다. */
    @Test
    public void noMeetNumber(){
        assertPasswordStrength("ABCabcABC", PasswordStrength.NORMAL);
        assertPasswordStrength("abvavbABC", PasswordStrength.NORMAL);
    }

    /* 다른 조건은 충족하지만 길이가 8 미만인 경우 ===> 안전도 수준 : 약함 */
    @Test
    public void noMeetLength(){
        assertPasswordStrength("abAB12", PasswordStrength.NORMAL);
        assertPasswordStrength("ABC123", PasswordStrength.NORMAL);
    }

    /* 길이만 충족할 경우 */
    @Test
    public void onlyUpper(){
        assertPasswordStrength("adfdfaabcbj", PasswordStrength.WEAK);
    }

    /* 대문자만 충족할 경우 */
    @Test
    public void onlyLength(){
        assertPasswordStrength("adafB", PasswordStrength.WEAK);
        assertPasswordStrength("BBBB", PasswordStrength.WEAK);
    }

    /* 숫자만 충족할 경우 */
    @Test
    public void onlyNumber(){
        assertPasswordStrength("abd123", PasswordStrength.WEAK);
        assertPasswordStrength("123abab", PasswordStrength.WEAK);
    }

    /* 아무것도 충족하지 않는 경우 */
    @Test
    public void nothing(){
        assertPasswordStrength("aseg", PasswordStrength.WEAK);
    }
}