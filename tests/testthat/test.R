test_that("error when wrong inputs",{
 expect_error(address$new(1,2))
  expect_error(address$new("12 rue victor hugo paris","france"))
  expect_error(address$new("apdoeporpaoofjrizfjriezfjir789zrf78rz"))
})

test_that("good types",{
  a<-address$new("paris france")
  expect_true(isS4(a))
  expect_true(is.character(a$Formatted_Address))
  expect_true(is.numeric(a$Coordinates)&&length(a$Coordinates)==2)
})