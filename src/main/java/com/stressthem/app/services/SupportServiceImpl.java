package com.stressthem.app.services;

import com.stressthem.app.domain.entities.Ticket;
import com.stressthem.app.domain.models.service.TicketServiceModel;
import com.stressthem.app.repositories.TicketRepository;
import com.stressthem.app.services.interfaces.SupportService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;

@Service
public class SupportServiceImpl implements SupportService {
    private TicketRepository ticketRepository;
    private ModelMapper modelMapper;

    @Autowired
    public SupportServiceImpl(TicketRepository ticketRepository, ModelMapper modelMapper) {
        this.ticketRepository = ticketRepository;
        this.modelMapper = modelMapper;
    }

    @Override
    public void saveTicket(TicketServiceModel ticketServiceModel) {
        Ticket ticket = this.modelMapper.map(ticketServiceModel, Ticket.class);
        ticket.setLocalDateTime(LocalDateTime.now(ZoneId.systemDefault()));
        ticketRepository.save(ticket);
    }
}
