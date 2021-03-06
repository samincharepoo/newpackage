#have to import your own library, even though the test exists
#in the package

library(newpackage)

test_that('initialize works for a pokemon name that exists',
          {
            p= Pokemon$new("Litwick")
            expect_equal(p$name, 'Litwick')
            expect_equal(p$startHP, 50)
            expect_equal (p$type1, 'Ghost')
            expect_equal(p$type2, 'Fire')
            expect_equal(p$awake,TRUE)
          }
)
