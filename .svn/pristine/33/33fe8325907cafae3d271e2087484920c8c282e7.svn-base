package com.dto;

public enum ResultType {
    
    
    COMMON("01", "普通"), 
    BAIKE("02", "百科"), 
    MUSIC1("03", "音乐"), 
    DIC("04", "词典"), 
    TIEBA("05", "贴吧"), 
    ZHIDAO("06", "知道"), 

    ;

    private String code;

    private String desc;

    /**
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * 构造函数
     * 
     * @param code
     * @param desc
     */
    private ResultType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    /**
     * 通过枚举<code>code</code>获得枚举
     * 
     * @param code
     * @return
     */
    public static ResultType getByCode(String code) {
        for (ResultType value : values()) {
            if (value.getCode().equals(code)) {
                return value;
            }
            
        }
        return null;
    }

    
    
    

}
