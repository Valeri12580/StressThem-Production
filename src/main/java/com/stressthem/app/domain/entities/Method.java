package com.stressthem.app.domain.entities;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.*;

@Table(name = "methods")
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Method extends BaseEntity {

    @Column
    @NonNull
    private String name;


    @ManyToMany(mappedBy = "methods")
    private List<Plan>plans;


}
