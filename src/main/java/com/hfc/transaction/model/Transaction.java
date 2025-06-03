package com.hfc.transaction.model;

import jakarta.persistence.*;


import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "transactions")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "transaction_ref", unique = true)
    private String transactionRef;
    @Column(name = "account_number")
    private String accountNumber;
    private Double amount;
    private String narration;
    @Column(name = "transaction_time")
    private LocalDateTime transactionTime;
    private String status;
}
