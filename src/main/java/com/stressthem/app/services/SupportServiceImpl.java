package com.stressthem.app.services;

import com.stressthem.app.domain.entities.Ticket;
import com.stressthem.app.domain.models.service.TicketServiceModel;
import com.stressthem.app.repositories.TicketRepository;
import com.stressthem.app.services.interfaces.SupportService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.List;

@Service
public class SupportServiceImpl implements SupportService {
    private TicketRepository ticketRepository;
    private ModelMapper mapper;

    @Autowired
    public SupportServiceImpl(TicketRepository ticketRepository, ModelMapper modelMapper) {
        this.ticketRepository = ticketRepository;
        this.mapper = modelMapper;
    }

    @Override
    public void saveTicket(TicketServiceModel ticketServiceModel) {
        Ticket ticket = this.mapper.map(ticketServiceModel, Ticket.class);
        ticket.setLocalDateTime(LocalDateTime.now(ZoneId.systemDefault()));
        ticketRepository.save(ticket);
    }

    @Override
    public List<TicketServiceModel> findAllTickets() {
        return Arrays.asList(this.mapper.map(this.ticketRepository.findAll(),TicketServiceModel[].class));
    }

    @Override
    public Page<Ticket> findAllTickets(int pageNumber, int pageSize, String filterBy) {

        Pageable paging= PageRequest.of(pageNumber,pageSize);

       return this.ticketRepository.findAll(paging);

    }
}
