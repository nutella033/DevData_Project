modal <- function(id,title,button,...) {
    tagList(
        tags$button(class="btn","data-toggle"="modal","data-target"=paste0("#",id),style="margin:10px 0 10px 0;",button),
        tags$div(class="modal fade",id=id,tabindex="-1",role="dialog","aria-labelledby"="myModalLabel","aria-hidden"="true",
            tags$div(class="modal-dialog",
                tags$div(class="modal-content",
                    tags$div(class="modal-header",
                        tags$button(type="button",class="close","data-dismiss"="modal",
                            tags$span("aria-hidden"="true","X")
                        ),
                        tags$h4(class="modal-title",id="myModalLabel",title)
                    ),
                    tags$div(class="modal-body",...)#,
                    #tags$div(class="modal-footer",
                    #    tags$button(type="button",class="btn btn-default","data-dismiss"="modal","Close"),
                    #    tags$button(type="button",class="btn btn-primary","Save")
                    #)
                )
            )
        )
    )
}


