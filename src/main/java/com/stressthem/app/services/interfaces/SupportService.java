package com.stressthem.app.services.interfaces;

import com.stressthem.app.domain.entities.Ticket;
import com.stressthem.app.domain.models.service.TicketServiceModel;
import org.springframework.data.domain.Page;

import java.util.List;

public interface SupportService {

    void saveTicket(TicketServiceModel ticketServiceModel);

    List<TicketServiceModel> findAllTickets();

    Page<Ticket> findAllTickets(int pageNumber, String filterBy);

    void changeTicketStatus(String id, boolean status);

}
