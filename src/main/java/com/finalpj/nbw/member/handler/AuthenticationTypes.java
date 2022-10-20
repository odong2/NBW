package com.finalpj.nbw.member.handler;

public enum AuthenticationTypes implements BaseEnumCode<String> {

    BadCredentialsException("비밀번호불일치", "비밀번호불일치"),
    UsernameNotFoundException("계정없음", "계정없음"),
    AccountExpiredException("계정만료", "계정만료"),
    CredentialsExpiredException("비밀번호만료", "비밀번호만료"),
    DisabledException("계정비활성화", "계정비활성화"),
    LockedException("계정잠김", "계정잠김"),
    NoneException("알수없는 에러", "알 수 없는 에러 입니다.");

    private String desc;

    private String value;

    AuthenticationTypes(String desc, String value) {
        this.desc = desc;
        this.value = value;
    }

    @Override
    public String getValue() {
        return this.value;
    }

    private static final Map<String, AuthenticationTypes> descriptions = Collections.unmodifiableMap(Stream.of(values()).collect(Collectors.toMap(AuthenticationTypes::name, Function.identity())));

    public static AuthenticationTypes findOf(String findValue) {
        return Optional.ofNullable(descriptions.get(findValue)).orElse(NoneException);
    }

}