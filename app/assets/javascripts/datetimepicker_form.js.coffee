

$ ->


  if jQuery("#flash_msg div").length > 0
    noticeTimer = setTimeout(->
      $("#flash_msg div").slideUp();
    , 3500)

  $.datepicker.setDefaults({ dateFormat: 'dd.mm.yy' })
  is_new = $('#order_js_date').data('new')
  $.datepicker.setDefaults({ minDate: '+1' }) if !!is_new
  $("body").on "focus", "#body .datepicker", (event) ->
    $(@).datetimepicker(
      controlType: 'select',
      timeFormat: 'HH:mm',
      stepMinute: 15,
      showOtherMonths: true,
      selectOtherMonths: false,
      hourMin: 7,
      hourMax: 20,
      hour: 16,
      onSelect: (dateText, inst) ->
        $(@).closest("div").find(".btn").hide().removeClass('hidden').show()
        $('.date_preview').html( dateText.split(" ")[0] )
        $('.time_preview').html( dateText.split(" ")[1] )
        date = new Date()
        date.setFullYear(dateText.split(" ")[0].split('.')[2])
        date.setMonth((parseInt(dateText.split(" ")[0].split('.')[1]) - 1), dateText.split(" ")[0].split('.')[0])
        $.each $('.days_of_week').children('label'), ->
          $(this).removeClass('disabled')
          $(this).removeClass('active')
        $.each $('.days_of_week').children('label').children('input'), ->
          $(this).attr('disabled', 'disabled')
        $($('.days_of_week').children('label')[date.getDay()]).addClass('disabled')
        $($('.days_of_week').children('label').children('input')[date.getDay()]).removeAttr('disabled')
    ).datetimepicker("show")
    
    
  $("body").on "blur", "#new_job .lcl_map_data", (event) ->
    form = $("#new_job .map_form")
    window.errors = false
    console.log "dkgmkdmn"
    form.find(".street_number_error").replaceWith(" ")
    form.find(".street_error").replaceWith(" ")
    $("#new_job .lcl_map_data").removeClass("error")
    if form.find(".lcl_txt.street") && form.find(".lcl_txt.street").val() == ""
      form.append( "<div class='street_error'>Please provide a Street!</div>")
      $("#new_job .lcl_map_data").addClass("error")
    if form.find(".lcl_txt.street_number") && form.find(".lcl_txt.street_number").val() == ""
      form.append( "<div class='street_number_error'>Please provide a Number!</div>")
      $("#new_job .lcl_map_data").addClass("error")
      
  #   if form.find(".lcl_txt.street_number") && form.find(".lcl_txt.street_number").val() == ""
  #     lang_text = $(".lcl_txt.street_number").data('error')
  #     $(".lcl_txt.street_number").parent().siblings('p.error').html(lang_text)
  #     window.errors = true
  #     markErrorField('#fixed_form .lcl_address_data')
  #   else
  #     unmarkErrorField('#fixed_form .lcl_address_data')
  #     $(".lcl_txt.street_number").parent().siblings('p.error').html("")
  # 
  #   if form.find(".lcl_txt.city").find(':selected').text() not in window.available_cities
  #     lang_text = $(".lcl_txt.city").data('error')
  #     lang_text += " Correct: Berlin, Hamburg"
  #     $(".lcl_txt.city").parent().siblings('p.error').html(lang_text)
  #     window.errors = true
  #     markErrorField('#fixed_form .lcl_address_data')
  #   else
  #     unmarkErrorField('#fixed_form .lcl_address_data')
  #     $(".lcl_txt.city").parent().siblings('p.error').html("")