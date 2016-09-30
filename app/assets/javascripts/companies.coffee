class WorkerHistory

  constructor:()->
    @init()

  init: ()->
    $(document).foundation()
    @workerModalHandler()

  workerModalHandler: ()->
    $('[data-trigger-modal]').on 'click', (e)->
      e.preventDefault()
      e.stopPropagation()
      work_id = $(e.target).data('trigger-modal')
      console.log work_id
      
      # Make Ajax Request to get Job Info
      $.ajax(
        url: "/companies/work_data/#{work_id}"
        type: 'GET'
        dataType: 'json').done((data) ->
          console.log data

          # Fills var with data
          start_date = data.start_date 
          end_date = data.end_date
          company_name = data.company.name
          company_comments = data.comment_company
          worker_comments = data.comment_user
          
          # Replace html values
          $('#modal-start-date').html(start_date)
          $('#modal-end-date').html(end_date)
          $('#modal-company-name').html(company_name)
          $('#modal-company-comments').html(company_comments)
          $('#modal-worker-comments').html(worker_comments)
          
          return
          ).fail(->
            console.log 'error'
            return
            ).always ->
            console.log 'complete'
            return

      # Open Modal
      $('#detailWorkRelationship').foundation('open')
      return

$(document).on 'turbolinks:load', (e)->
  window.theme = new WorkerHistory()