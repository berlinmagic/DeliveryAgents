@checkDaLocationFormBox = ( field ) ->
  if field.val() != "" && $(field).val()?
    $(field).val() + " "
  else
    ""

@updateLocationFormDataField = (el) ->
  # mdata = ""
  # form  = $(el).closest(".map_form")
  # el = form.find(".lcl_map_data")
  # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.street") )
  # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.street_number") )
  # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.zip") )
  # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.city") )
  # # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.country") )
  # if mdata? && mdata != "" && mdata != false
  #   $(el).val(mdata)
  $(el).addresspicker( "updatePosition") if $(el).addresspicker?


@updateshortLocationFormDataField = (el) ->
  mdata = ""
  form  = $(el).closest(".map_form")
  el = form.find(".lcl_short_data")
  mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.street") )
  mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.street_number") )
  mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.zip") )
  mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.city") )
  # mdata = mdata + checkDaLocationFormBox( form.find("input.lcl_txt.country") )
  el.val("#{mdata}")


@updateLocationFormGoogleMapField = (el) ->
  form  = $(el).closest(".map_form")
  lat   = form.find(".lcl_latitude").val()
  long  = form.find(".lcl_longitude").val()
  $(el).addresspicker(
    mapOptions:
      zoom: 15
      center: new google.maps.LatLng(lat, long)
    elements:
      map:          if form.find(".address_preview_map").length > 0 then "##{form.find(".address_preview_map").attr("id")}" else false
      lat:          if form.find(".lcl_latitude").length > 0 then "##{form.find(".lcl_latitude").attr("id")}" else false
      lng:          if form.find(".lcl_longitude").length > 0 then "##{form.find(".lcl_longitude").attr("id")}" else false
      locality:     if form.find(".lcl_txt.city").length > 0 then "##{form.find(".lcl_txt.city").attr("id")}" else false
      sublocality:  if form.find(".lcl_txt.subcity").length > 0 then "##{form.find(".lcl_txt.subcity").attr("id")}" else false
      country:      if form.find(".lcl_txt.country").length > 0 then "##{form.find(".lcl_txt.country").attr("id")}" else false
      streetNumber: if form.find(".lcl_txt.street_number").length > 0 then "##{form.find(".lcl_txt.street_number").attr("id")}" else false
      route:        if form.find(".lcl_txt.street").length > 0 then "##{form.find(".lcl_txt.street").attr("id")}" else false
      postal_code:  if form.find(".lcl_txt.zip").length > 0 then "##{form.find(".lcl_txt.zip").attr("id")}" else false
      administrative_area_level_1: if form.find(".lcl_txt.state").length > 0 then "##{form.find(".lcl_txt.state").attr("id")}" else false
      administrative_area_level_2: if form.find(".lcl_txt.county").length > 0 then "##{form.find(".lcl_txt.county").attr("id")}" else false
      administrative_area_level_3: if form.find(".lcl_txt.subcounty").length > 0 then "##{form.find(".lcl_txt.subcounty").attr("id")}" else false
      formatted_address: if form.find(".lcl_txt.address").length > 0 then "##{form.find(".lcl_txt.address").attr("id")}" else false
  )
  $(el).addresspicker( "marker").setVisible(true)
  $(el).addresspicker( "updatePosition")
  window.setTimeout (->
    $(el).addresspicker( "updatePosition")
  ), 500


@updateLocationFormGoogleField = (el) ->
  form  = $(el).closest(".map_form")
  # alert "bla"
  $(el).addresspicker(
    elements:
      lat:          if form.find(".lcl_latitude").length > 0 then "##{form.find(".lcl_latitude").attr("id")}" else false
      lng:          if form.find(".lcl_longitude").length > 0 then "##{form.find(".lcl_longitude").attr("id")}" else false
      locality:     if form.find(".lcl_txt.city").length > 0 then "##{form.find(".lcl_txt.city").attr("id")}" else false
      sublocality:  if form.find(".lcl_txt.subcity").length > 0 then "##{form.find(".lcl_txt.subcity").attr("id")}" else false
      country:      if form.find(".lcl_txt.country").length > 0 then "##{form.find(".lcl_txt.country").attr("id")}" else false
      streetNumber: if form.find(".lcl_txt.street_number").length > 0 then "##{form.find(".lcl_txt.street_number").attr("id")}" else false
      route:        if form.find(".lcl_txt.street").length > 0 then "##{form.find(".lcl_txt.street").attr("id")}" else false
      postal_code:  if form.find(".lcl_txt.zip").length > 0 then "##{form.find(".lcl_txt.zip").attr("id")}" else false
      administrative_area_level_1: if form.find(".lcl_txt.state").length > 0 then "##{form.find(".lcl_txt.state").attr("id")}" else false
      administrative_area_level_2: if form.find(".lcl_txt.county").length > 0 then "##{form.find(".lcl_txt.county").attr("id")}" else false
      administrative_area_level_3: if form.find(".lcl_txt.subcounty").length > 0 then "##{form.find(".lcl_txt.subcounty").attr("id")}" else false
      formatted_address: if form.find(".lcl_txt.address").length > 0 then "##{form.find(".lcl_txt.address").attr("id")}" else false
  )



@updateLocationFormAllGoogleFields = ->
  $("input.lcl_map_data").each ->
    updateLocationFormGoogleMapField(@)
  $("input.lcl_short_data").each ->
    # updateshortLocationFormDataField(@)
    updateLocationFormGoogleField( @ )
    
