test_that("error when wrong inputs",{
 expect_error(address$new(1,2))
  expect_error(address$new("apdoeporpaoofjrizfjriezfjir789zrf78rz"))
})

test_that("good types",{
  a<-address$new("paris france")
  expect_true(isS4(a))
  expect_true(is.character(a$Formatted_Address))
  expect_true(is.numeric(a$Coordinates)&&length(a$Coordinates)==2)
})

test_that("Pop",{
  a<-address$new("paris france")
  expect_true(isS4(a))
  expect_true(is.character(a$Formatted_Address))
  expect_true(is.numeric(a$Coordinates)&&length(a$Coordinates)==2)
})

test_that("not exported",{
      expect_true(create_url_from_address("paris",reg="ES")=="https://maps.googleapis.com/maps/api/geocode/json?address=paris&reg=ES&key=AIzaSyApGO2vCAE8dw7MhpKN2esy7cIDxtk8PiY")
                      
})