20220908
Fred Thomas

## Validation of electricity grid distruption by storms

The adjacent folder `output` contains model output from open-gira, specifically
an estimate of the degree of disruption to the Puerto Rican electricity grid in
the aftermath of 2017's Hurricane Maria.

See the `targets__storm_rNA_s99_n99_2017_0.gpkg` and their `f_value` field for
estimates of degree of electricity supply. Where `f_value < 1`, there has been
disruption to supply for that area.

The model has been evaluated for three values of damage threshold -- the wind
speed at which infrastructure is deemed to fail: 20, 35 and 50 m/s.

It was run with data characterising the Maria stormtrack, processed into the
same format as the synthetic IBTrACS data that open-gira has been designed to
operate on (see `input` for this file).

To plot some of the outputs (target files) see the `compare_thresholds.ipynb`
notebook. A `requirements.txt` file specifies the environment required to run
the notebook.

To (maybe) recreate this analysis:
- Clone the open-gira repository
- Checkout `63ab3947`
- Create and activate a suitable Python environment from the .yml file
- Place `input/STORM_DATA_IBTRACS_NA_1000_YEARS_99.txt` in
  `results/input/stormtracks/events/constant/NA/`
- Move `input/run_maria.sh` to the root of the open-gira repository and run it
