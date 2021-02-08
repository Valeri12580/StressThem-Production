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
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.List;

@Service
public class SupportServiceImpl implements SupportService {
    private TicketRepository ticketRepository;
    private ModelMapper mapper;
    public static final int PAGE_SIZE = 5;

    @Autowired
    public SupportServiceImpl(TicketRepository ticketRepository, ModelMapper modelMapper) {
        this.ticketRepository = ticketRepository;
        this.mapper = modelMapper;
    }

    @Override
    public void saveTicket(TicketServiceModel ticketServiceModel) {
        Ticket ticket = this.mapper.map(ticketServiceModel, Ticket.class);
        ticket.setCreatedOn(LocalDateTime.now(ZoneId.systemDefault()));
        ticketRepository.save(ticket);
    }

    @Override
    public List<TicketServiceModel> findAllTickets() {
        return Arrays.asList(this.mapper.map(this.ticketRepository.findAll(), TicketServiceModel[].class));
    }

    @Override
    public Page<Ticket> findAllTickets(int pageNumber, String filterBy) {
        Pageable paging = PageRequest.of(pageNumber, PAGE_SIZE, Sort.by("createdOn").descending());
        return this.ticketRepository.findAll(paging);

    }
}
