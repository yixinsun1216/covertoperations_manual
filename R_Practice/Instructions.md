## Data Merging and Simple Features Practice

### Overview

The goal of this exercise is to match the leases in one dataset to the leases in another. The `raw_data` folder contains two datasets, `state.Rda` and `di.Rda`. We basically want the datasets to be completely disjoint - we want to get rid of all leases in DI that appear in the state dataset. 

### Procedure 

1. I started a `base_code.R` file, which will help you get started. The header you see below is suppose to get the file path to wherever your covertoperations Github directory is. This works if you have made a Git project in RStudio - if you aren't using RStudio, just set root equal to whereever your covertoperations folder is.

    ```
    root <- getwd()
    while(basename(root) != "covertoperations") {
      root = dirname(root)
    }
    ```
2. The datasets are loaded in in base_code.R. The next step is to intersect the polygons in the di and state datasets. You will be using the `sf` package for this. Intersecting can sometimes pick up small slivers of intersection, so we only want to keep intersections of the intersected area is greater than 10% the area of the di polygon - the constant `int_lb` (intersection lower bound) is already made on line 18. 
3. Since leases are usually only 5 to 10 years long, after which that piece of land can be re-leased, we also want to make sure there is a time overlap in the leases. We do this by comparing the `EffDate` (Effective Date) column. Leases should be "true" intersections if their effective dates are within 121 days of each other. 
4. After you've figured out which polygons have intersecting areas and times, you want to make sure you are only matching one di polygon to one state polygon. If there are multiple di polygons matched to one state polygon, you want to keep the di polygon that has greatest intersection area with the state polygon and get rid of the other matches. The same is true if there are multiple state polygons matched to one di polygon. You will do this using a combination of `group_by`, `arrange`, and `filter`. 
5. Once you have figured out which polygons are real matches in the two datasets, you want to remove from the di dataset the polygons that are matched to the state dataset. You can find the function for this in `dplyr`. 
6. Once you are done, save the di file in `generated_data` and name it di_yourname.Rda. For example, the dataset Sunny created would be called di_sunny.Rda. 