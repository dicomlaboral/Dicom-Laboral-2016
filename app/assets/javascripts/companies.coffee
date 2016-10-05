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
          work = data.work
          ratinguser = data.ratinguser

          # Fills var with data
          start_date = work.start_date 
          end_date = work.end_date
          company_name = work.company.name
          company_comments = work.comment_company
          worker_comments = work.comment_user
          c1 = ratinguser[0].value
          c2 = ratinguser[1].value
          c3 = ratinguser[2].value
          c4 = ratinguser[3].value
          c5 = ratinguser[4].value
          
          # Replace html values
          $('#modal-start-date').html(start_date)
          $('#modal-end-date').html(end_date)
          $('#modal-company-name').html(company_name)
          $('#modal-company-comments').html(company_comments)
          $('#modal-worker-comments').html(worker_comments)
          $("#ul1").empty();
          $("#ul2").empty();
          $("#ul3").empty();
          $("#ul4").empty();
          $("#ul5").empty();
          $('#ul1').append('<li class="c-rating__item is-active" data-index="0"></li>'.repeat(c1))
          $('#ul1').append('<li class="c-rating__item" data-index="4"></li>'.repeat(5-c1))
          $('#ul2').append('<li class="c-rating__item is-active" data-index="0"></li>'.repeat(c2))
          $('#ul2').append('<li class="c-rating__item" data-index="4"></li>'.repeat(5-c2))
          $('#ul3').append('<li class="c-rating__item is-active" data-index="0"></li>'.repeat(c3))
          $('#ul3').append('<li class="c-rating__item" data-index="4"></li>'.repeat(5-c3))
          $('#ul4').append('<li class="c-rating__item is-active" data-index="0"></li>'.repeat(c4))
          $('#ul4').append('<li class="c-rating__item" data-index="4"></li>'.repeat(5-c4))
          $('#ul5').append('<li class="c-rating__item is-active" data-index="0"></li>'.repeat(c5))
          $('#ul5').append('<li class="c-rating__item" data-index="4"></li>'.repeat(5-c5))
          
          
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