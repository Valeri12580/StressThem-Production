package com.stressthem.app.initialization;

import com.stressthem.app.domain.entities.Method;
import com.stressthem.app.repositories.MethodRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
@Order(value = 3)
public class MethodInit implements CommandLineRunner {
    private MethodRepository methodRepository;

    @Autowired
    public MethodInit(MethodRepository methodRepository) {
        this.methodRepository = methodRepository;
    }

    @Override
    public void run(String... args) throws Exception {
        if(methodRepository.count()==0){
            Method spacex = new Method("SpaceX",null);
            Method randPackets = new Method("RandPackets",null);
            Method httPrequest = new Method("HTTPrequest",null);
            Method pathFinder = new Method("PathFinder",null);
            Method mixed = new Method("Mixed",null);
            Method fiveM = new Method("FiveM",null);
            Method uamBypass = new Method("UAMBypass",null);
            Method cfCrasher1 = new Method("CFCrasher1",null);
            Method cfCrasher2 = new Method("CFCrasher2",null);
            Method httPstormSG = new Method("HTTPstormSG",null);
            Method httPstormPG= new Method("HTTPstormPG",null);
            Method httPstormMIX= new Method("HTTPstormMIX",null);
            Method httpRND= new Method("httpRND",null);
            Method xFreeze= new Method("xFreeze",null);

            this.methodRepository.saveAll(List.of(spacex,randPackets,httPrequest,pathFinder,mixed,fiveM,uamBypass,cfCrasher1,cfCrasher2,
                    httPstormSG,httPstormPG,httPstormMIX,httpRND,xFreeze));
        }
    }
}
