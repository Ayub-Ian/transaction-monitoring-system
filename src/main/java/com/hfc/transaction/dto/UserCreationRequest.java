package com.hfc.transaction.dto;

import lombok.Data;

import java.util.Set;

@Data
public class UserCreationRequest {
    private String email;
    private String password;
    private Set<String> roles;
}