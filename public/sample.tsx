import {
  Button,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  SelectChangeEvent,
  Slider,
  TextField,
} from "@mui/material";
import { ChangeEvent, useEffect, useState } from "react";
import Filtered from "./FilterItem";
import styles from "../styles/Home.module.css";
import {
  getNutrientFilter,
  getNutrientFilteredData,
} from "../lib/Services/FoodNutrService";

export interface SelectedFilters {
  filterColumn: string;
  filterValue: number;
  operator: string;
  type: number;
}

interface NutFilters {
  name: string;
  value: string;
  type: number;
}

interface FoodNutrList {
  name: string;
  nutrients: [
    {
      filter: string;
      calculatedNut: string;
    }
  ];
}

const Filter = () => {
  const [selectedFilters, setSelectedFilter] = useState<SelectedFilters[]>([]);
  const [nutFilters, setNutFilters] = useState<NutFilters[]>([]);
  const [foodNutrList, setFoodNutrList] = useState<FoodNutrList[]>([]);

  useEffect(() => {
    const fetchNutrientFilters = async () => {
      const nutrientFilters = await getNutrientFilter();
      setNutFilters(nutrientFilters)
    }
    fetchNutrientFilters()
  }, []);

  const handleChange = (
    filterColumn: string,
    element: SelectedFilters,
    index: number
  ) => {
    let newArr = [...selectedFilters];
    const findColumnName = nutFilters.find(
      (item) => item.value === filterColumn && item.type === 1
    );
    newArr[index] = {
      ...element,
      filterColumn,
      type: findColumnName ? 1 : 2,
    };
    setSelectedFilter(newArr);
  };

  const handleValueChange = (filterValue: string, index: number) => {
    let newArr = [...selectedFilters];
    newArr[index].filterValue = parseInt(filterValue);
    setSelectedFilter(newArr);
  };

  const handleAddFilter = () => {
    setSelectedFilter([
      ...selectedFilters,
      {
        filterColumn: "",
        filterValue: 0,
        operator: "=",
        type: 3,
      },
    ]);
  };

  const deleteFilter = (index: number) => {
    const filterData = selectedFilters.filter((ele, i) => i !== index);
    setSelectedFilter(filterData);
  };

  const conditionHandler = (selector: number, index: number) => {
    let newArr = [...selectedFilters];
    if (selector === 1) {
      newArr[index].operator = ">";
    } else if (selector === 2) {
      newArr[index].operator = "<";
    }
    setSelectedFilter(newArr);
  };

  const handleSlider = (value: string, index: number) => {
    let newArr = [...selectedFilters];
    newArr[index].filterValue = parseInt(value);
  };

  const handleViewData = () => {
    const fetchNutrientsData = async () => {
      const nutrientsList = await getNutrientFilteredData(selectedFilters);
      setFoodNutrList(nutrientsList);
    };
    fetchNutrientsData();
  };

  return (
    <div>
      <h5 className="text-xl">Filters</h5>
      <div className="mt-2 mb-3">
        {selectedFilters.map((item, i) => (
          <div key={i} className={styles.filterNameContent}>
            <div className="flex items-center">
              <div
                onClick={() => deleteFilter(i)}
                className={styles.deleteButton}
              >
                x
              </div>
              <FormControl variant="standard" sx={{ m: 1, minWidth: 200 }}>
                <InputLabel id="demo-simple-select-standard-label">
                  Filter
                </InputLabel>
                <Select
                  labelId="demo-simple-select-standard-label"
                  id="demo-simple-select-standard"
                  value={item.filterColumn}
                  onChange={(e: SelectChangeEvent<string>) =>
                    handleChange(e.target.value, item, i)
                  }
                  label="Filter"
                >
                  {nutFilters.map((ele, i) => (
                    <MenuItem key={i} value={ele.value}>
                      {ele.name}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </div>

            {item.filterColumn && (
              <div className={styles.rangeWrapper}>
                <div className={styles.buttonGroup}>
                  <div
                    className={styles.conditionButton}
                    style={
                      item.operator === ">"
                        ? { background: "#0d6efd", color: "#fff" }
                        : {}
                    }
                    onClick={() => conditionHandler(1, i)}
                  >
                    {">"}
                  </div>
                  <div
                    className={styles.conditionButton}
                    style={
                      item.operator === "<"
                        ? { background: "#0d6efd", color: "#fff" }
                        : {}
                    }
                    onClick={() => conditionHandler(2, i)}
                  >
                    {"<"}
                  </div>
                </div>
                <FormControl variant="standard" sx={{ m: 1, minWidth: 200 }}>
                  {item.type === 1 ? (
                    <Slider
                      defaultValue={0}
                      onChange={(e: any) => handleSlider(e.target.value, i)}
                      aria-label="Default"
                      valueLabelDisplay="auto"
                    />
                  ) : (
                    <TextField
                      type="number"
                      onChange={(e: ChangeEvent<HTMLInputElement>) =>
                        handleValueChange(e.target.value, i)
                      }
                      id="standard-basic"
                      label="Filter Value"
                      variant="standard"
                    />
                  )}
                </FormControl>
              </div>
            )}
          </div>
        ))}
      </div>
      <Button onClick={handleAddFilter} variant="contained" style={{backgroundColor: "#1976d2"}}>
        ADD ANOTHER FILTER
      </Button>
      <Button
        style={{ marginLeft: "20px", backgroundColor: "#1976d2" }}
        onClick={handleViewData}
        variant="contained"
      >
        VIEW
      </Button>

      {foodNutrList.length ? (
        <Filtered foodNutrList={foodNutrList} />
      ) : (
        <p style={{ marginTop: 15 }}>No Records Found</p>
      )}
    </div>
  );
};

export default Filter;