test_that("error when wrong inputs",{
 expect_error(address$new(1,2))
  expect_error(address$new("12 rue victor hugo paris","france"))
  expect_error(address$new("apdoeporpaoofjrizfjriezfjir789zrf78rz"))
})

test_that("good",{
  expect_true(1+1==2)
})