$ ->
  parsley_config =
    inputs: "input, textarea, select" # Default supported inputs.
    excluded: "input[type=hidden], :disabled" # Do not validate input[type=hidden] & :disabled.
    animate: false # fade in / fade out error messages
    animateDuration: 300 # fadein/fadout ms time
    focus: "first" # 'fist'|'last'|'none' which error field would have focus first on form validation
    successClass: "has-success" # Class name on each valid input
    errorClass: "has-error" # Class name on each invalid input
    errorMessage: false # Customize an unique error message showed if one constraint fails
    showErrors: true # Set to false if you don't want Parsley to display error messages
    useHtml5Constraints: false
    errors:
      classHandler: (elem, isRadioOrCheckbox) ->

        # specify where parsley error-success classes are set
        $(elem).parents ".form-group"

      container: (elem, isRadioOrCheckbox) ->
        $(elem).parents ".form-group"

      errorsWrapper: "<span class=\"help-block\"></span>" # do not set an id for this elem, it would have an auto-generated id
      errorElem: "<span></span>" # each field constraint fail in an li

    listeners:
      onFieldValidate: (elem, ParsleyForm) -> # Executed on validation. Return true to ignore field validation
        false

      onFormSubmit: (isFormValid, event, ParsleyForm) -> # Executed once on form validation

      onFieldError: (elem, constraints, ParsleyField) -> # Executed when a field is detected as invalid

      onFieldSuccess: (elem, constraints, ParsleyField) -> # Executed when a field passes validation

  $('#personal-quote').parsley(parsley_config)
  $('#company-quote').parsley(parsley_config)