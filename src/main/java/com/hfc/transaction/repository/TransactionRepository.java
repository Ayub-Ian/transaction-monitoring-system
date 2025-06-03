package com.hfc.transaction.repository;

import com.hfc.transaction.model.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.Optional;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {
    Optional<Transaction> findByTransactionRef(String transactionRef);

    @Query("SELECT t FROM Transaction t WHERE " +
            "(:accountNumber IS NULL OR t.accountNumber = :accountNumber) AND " +
            "(:transactionRef IS NULL OR t.transactionRef = :transactionRef) AND " +
            "(:status IS NULL OR t.status = :status) AND " +
            "(:from IS NULL OR t.transactionDate >= :from) AND " +
            "(:to IS NULL OR t.transactionDate <= :to)")
    Page<Transaction> findAll(
            @Param("accountNumber") String accountNumber,
            @Param("transactionRef") String transactionRef,
            @Param("status") String status,
            @Param("from") LocalDateTime from,
            @Param("to") LocalDateTime to,
            Pageable pageable
    );

}