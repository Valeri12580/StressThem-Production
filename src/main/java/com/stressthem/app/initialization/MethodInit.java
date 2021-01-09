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
            Method spacex = new Method("SpaceX");
            Method randPackets = new Method("RandPackets");
            Method httPrequest = new Method("HTTPrequest");
            Method pathFinder = new Method("PathFinder");
            Method mixed = new Method("Mixed");
            Method fiveM = new Method("FiveM");
            Method uamBypass = new Method("UAMBypass");
            Method cfCrasher1 = new Method("CFCrasher1");
            Method cfCrasher2 = new Method("CFCrasher2");
            Method httPstormSG = new Method("HTTPstormSG");
            Method httPstormPG= new Method("HTTPstormPG");
            Method httPstormMIX= new Method("HTTPstormMIX");
            Method httpRND= new Method("httpRND");
            Method xFreeze= new Method("xFreeze");

            this.methodRepository.saveAll(List.of(spacex,randPackets,httPrequest,pathFinder,mixed,fiveM,uamBypass,cfCrasher1,cfCrasher2,
                    httPstormSG,httPstormPG,httPstormMIX,httpRND,xFreeze));
        }
    }
}
