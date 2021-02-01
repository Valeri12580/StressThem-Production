package com.stressthem.app.domain.models.view;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.*;

@Getter
@Setter
@NoArgsConstructor
public class SupportPanelViewModel {

    private List<TicketViewModel>tickets;
    private int pageN;
}
