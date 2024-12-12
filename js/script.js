const STATESIDs = {
    1: "Aguascalientes",
    2: "Baja California",
    3: "Baja California Sur",
    4: "Campeche",
    5: "Chiapas",
    6: "Chihuahua",
    7: "Ciudad de México",
    8: "Coahuila",
    9: "Colima",
    10: "Durango",
    11: "Guanajuato",
    12: "Guerrero",
    13: "Hidalgo",
    14: "Jalisco",
    15: "Estado de México",
    16: "Michoacán",
    17: "Morelos",
    18: "Nayarit",
    19: "Nuevo León",
    20: "Oaxaca",
    21: "Puebla",
    22: "Querétaro",
    23: "Quintana Roo",
    24: "San Luis Potosí",
    25: "Sinaloa",
    26: "Sonora",
    27: "Tabasco",
    28: "Tamaulipas",
    29: "Tlaxcala",
    30: "Veracruz",
    31: "Yucatán",
    32: "Zacatecas",
    33: "Federales"
}

const ColoresCertificacionID = {
    1: {
        name: "uncertified",
        color: "#000000"
    },
    2: {
        name: "in_progress",
        color: "#FC541F"
    },
    3: {
        name: "denied",
        color: "#F83527"
    },
    4: {
        name: "certificate",
        color: "#4DBF3B"
    }
}

const createLocationsOnMap = (locations) => {
    const locationsObject = {};
    /**
     * The following function converts the information (array) into an object 
     * that is then passed to simplemaps
     */

    try {
        locations.forEach((location) => {
            const key = `map_point point_${Math.random()}`;
            locationsObject[key] = {
                ...location,
                state: STATESIDs[location.entidadID] ? STATESIDs[location.entidadID] : undefined,
                name: location.penitenciarioCEDesc,
                status: ColoresCertificacionID[location.certificacionID] ? ColoresCertificacionID[location.certificacionID].name : "uncertified",
                lat: location.latitud || location.lat,
                lng: location.longitud || location.lng,
                /**
                 * The description property carries the
                 * html structure of the pop-up
                 */
                description: `
                    <div class="pop-up">
                        <div class="section">
                            <div class="title"> CENTRO PENINTENCIARO </div>
                            <div class="content">
                                <div class="icon"> <img src="./images/icon-1.jpeg" /> </div>
                                <div class="info"> ${location.penitenciarioCEDesc} </div>
                            </div>
                        </div>
                        <div class="section">
                            <div class="title"> RESULTADO GLOBAL </div>
                            <div class="content">
                                <div class="icon"> <img src="./images/icon-2.jpeg" /> </div>
                                <div class="info color-status-${location.certificacionID} ${location.Porc != 0 ? 'flex-container' : "" }">
                                    <div>
                                        <svg class="svg-icon">
                                            <image xlink:href<image xlink:href="./images/icon-${location.certificacionID}.svg" src="="./images/check.svg" width="90" height="90"/> .svg" src="yourfallback.png"/> 
                                        </svg>
                                        ${location.Porc != 0 ? "<div>"+ location.certificacionDesc +"</div>" : ""}
                                    </div>
                                    <div>${location.Porc != 0
                                            ?  "<div class='progress'>" + (location.Porc * 100 || 0 ).toFixed(2) + "%</div>"
                                            : location.certificacionDesc || "Sin datos"}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                `,
                key,
                opacity: 1,
                border_color: "#f3f2f0",
                border: 1.5,
                type: "circle",
                color: ColoresCertificacionID[location.certificacionID].color
            };
        });
    } catch {
        simplemaps_countrymap_mapdata.locations = locationsObject;
    }

    simplemaps_countrymap_mapdata.locations = locationsObject;
}

const mapInitialData = (data, statesIds) => {
    let objectNewData = {};

    /**
     * The function converts the data into an array and 
     * adds its penitentiaries to it.
     */
    Object.entries(statesIds).map(([key, { name }]) => {
        objectNewData[key] = {
            name,
            penitentiaries: Object.values(data).filter((town) => town.state === name)
        }
    })

    /**
     * The function hides the locations with the simeplemaps API 
     * and refreshes the map
     */
    const hideElements = (search, showFunction) => {
        if(search) {
            Object.entries(data).forEach(([_, el]) => el.hide = "yes");
            showFunction();
        } else {
            Object.entries(data).forEach(([_, el]) => el.hide = "no");
        }
        simplemaps_countrymap.refresh();
    }

    return  {
        /**
         * The exposed function hides all the locations 
         * with the established parameter.
         */
        hideElements: (status) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if(el.status == status || status == "all") {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },
        /**
         * The exposed function hides all the locations 
         * with the established parameter.
         */
        hideElementsByYear: (year) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if(el.anio == year || year == "year") {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },

         hideElementsByName: (name) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if(el.name == name) {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },

        hideElementsFederal: (status) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if((el.status == status || status == "all") && el.entidadID == 33) {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },

        hideElementsByYearStateID: (year, entidad = 33) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if((el.anio == year || year == "year") &&  (el.state == entidad || el.entidadID == entidad)) {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },
        hideElementsStateID: (status, state) => {
            Object.entries(data).forEach(([_, el]) => {
                el.hide = "yes";

                if((el.status == status || status == "all") && (el.state == state)) {
                    el.hide = "no";
                }
            });
            simplemaps_countrymap.refresh();
        },

        /**
         * The exposed function filters all the locations 
         * with the established parameters.
         */
        filter: (state = undefined, penitentiary = undefined) => {
            try {

                // Filter by state and prison
                if(state && penitentiary) {
                    const search = objectNewData[state].penitentiaries.filter(({ name }) => name == penitentiary )[0];

                    hideElements(search, () => data[search.key].hide = "no")

                    return search;
                } else if (state) {
                    // Filter by state
                    const search = objectNewData[state]
                    hideElements(search, () => {
                        search.penitentiaries.forEach(({key}) => {
                            data[key].hide = "no"
                        })
                    })

                    return objectNewData[state].penitentiaries || [];
                } else {
                    /**
                     * In case the state and prison parameters are undefined, 
                     * all the locations will be shown and the initial 
                     * information will be returned.
                     */
                    Object.entries(data).map(([_, el]) => el.hide = "no");
                    simplemaps_countrymap.refresh();
    
                    return Object.entries(objectNewData).map(([key, {name}]) =>{
                        return {
                            key, name
                        }
                    });
                }   
            } catch (error) {
                /**
                 * If the value does not exist or there is an error, 
                 * the initial data will be returned and all the 
                 * locations will be displayed.
                 */
                simplemaps_countrymap.back()
            }
        }
    }

};

const createOptionElement = ({key, name}) => {
    const option = document.createElement("option");
    // Check which key to use depending on the length of the string
    option.setAttribute("value", key && key.length == 7 ? key : name);
    option.textContent = name;

    return option;
}

const insertOptionsElements = (optionsData = [], target, type = "sistema", complete) => {

    /** Remove all options */
    while(target.childNodes.length > 0) {
        target.removeChild(target.lastChild)
    }

    /** Insert new options */
    if(optionsData.length > 0) {
        target.appendChild(createOptionElement({ id: "", name: complete ? type : `Seleccionar ${type}.` }));
        target.append(...optionsData.map(createOptionElement));
    } else {
        target.appendChild(createOptionElement({ id: "", name: complete ? type : `Sin ${type}.` }));
    }
}

const removeSelected = (nodes, id) => {
    [...nodes].map((el) => {
       if(el) {
            if (el.getAttribute("value") === id) {
                el.setAttribute("selected", "");
            } else {
                el.removeAttribute("selected");
            }
       }
    });
}

const removeSelectedFilter = (nodes, key = "all") => {
    [...nodes].map((el) => {
        if(el.nodeName != "#text") {
            el.removeAttribute("selected");
            if(el.getAttribute("value") === key) {
                el.setAttribute("selected", "")
            }
        }
    });
}

const removeAllSelected = (nodes) => {
    [...nodes].map((el) => {
        if(el.nodeName != "#text") {
            el.removeAttribute("selected");
        }
    });
}

const createChart = (data) => {
    /**
     * This function converts the array of prisons into an array 
     * with the number of prisons filtered by the status property
     */
    const mapData = (penitentiariesData) => {
        const placeHolder = {
            certificate: 0,
            denied: 0,
            in_progress: 0,
            uncertified: 0
        };
        penitentiariesData.forEach((el) => placeHolder[el.status]++ );
        return Object.values(placeHolder);
    }
    
    // Map initial data
    const initialData = mapData(data);
    const htmlTitle = document.querySelector(".chart-title");

    // Create Doughnut and Pie chart with Chart.js
    const chart =  new Chart(document.getElementById("doughnut-chart"), {
        type: 'doughnut',
        data: {
          labels: ["Certificado", "Denegado", "En proceso", "Sin certificar"],
          datasets: [{
              backgroundColor: ["#4DBF3B", "#F83527","#FC541F","#000"],
              data: initialData,
            }]
        },
        options: {
          title: false,
          legend: false,
          tooltips: {
            callbacks: {
              label: (tooltipItem, data) => {
                //get the concerned dataset
                let dataset = data.datasets[tooltipItem.datasetIndex];
                //calculate the total of this data set
                let total = dataset.data.reduce((previousValue, currentValue) => previousValue + currentValue);
                //get the current items value
                let currentValue = dataset.data[tooltipItem.index];
                //calculate the precentage based on the total and current item, also this does a rough rounding to give a whole number
                let percentage = Math.floor(((currentValue/total) * 100)+0.5);
          
                return ` ${percentage}%`;
              }
            }
          }
        }
    });

    return {
        /**
         * The following function updates the graph 
         * and renames the span (the title).
         */
        update: (data = undefined, title) => {
            htmlTitle.innerText = title;
            chart.data.datasets[0].data = typeof data === "undefined" ? initialData : mapData(data);
            chart.update();
        }
    }
}

function createMap(data, { stateInput, penitentiariesInput, filterInput, yearInput }) {
    // Create locations on map
    createLocationsOnMap(data);
    simplemaps_countrymap.load()
    simplemaps_countrymap.hooks.complete = () => {
        // Mapdata simplemaps locations and return functions to filter.
        const { filter, hideElements, hideElementsByYear, hideElementsByName, hideElementsFederal, hideElementsByYearStateID, hideElementsStateID} =  mapInitialData(simplemaps_countrymap_mapdata.locations, simplemaps_countrymap_mapdata.state_specific);
        // Create chart
        const { update } = createChart(Object.values(simplemaps_countrymap_mapdata.locations));
        // Get initial data without filters
        const initialStates = filter();

        // Insert options elements of states
        insertOptionsElements(initialStates, stateInput);

        const handlerStateInput = (id = undefined) => {

            const stateId = typeof id == "string" ? id : stateInput.value;

            if(stateId != "Federales") {
                const penitentiaries = filter(stateId);
                // Insert options elements of penitentiaries 
                insertOptionsElements(penitentiaries, penitentiariesInput, "Centro penitenciario", true);
                simplemaps_countrymap.state_zoom(stateId);
                // Update chart
                update(penitentiaries, simplemaps_countrymap_mapdata.state_specific[stateId].name);

                removeSelectedFilter(filterInput.childNodes);
            } else {
                const penitentiaries = filter("MEXFEDERALES");
                // Insert options elements of penitentiaries 
                insertOptionsElements(penitentiaries, penitentiariesInput, "Centro penitenciario", true);
                update(penitentiaries, "Federales");
                removeSelectedFilter(filterInput.childNodes);
                simplemaps_countrymap.back();
            }
            removeSelectedFilter(filterInput.childNodes, "all");
            removeSelectedFilter(yearInput.childNodes, "year");


            filterInput.innerHTML = filterInput.innerHTML;
            yearInput.innerHTML = yearInput.innerHTML;
            penitentiariesInput.innerHTML = penitentiariesInput.innerHTML;
        }

        const handlerPenitentiariesInput = () => {
            if (stateInput.value != "Federales") {

                const stateData = penitentiariesInput.value == "Centro penitenciario" ? undefined : penitentiariesInput.value;

                filter(stateInput.value, stateData);
            } else {
                if (penitentiariesInput.value == "Centro penitenciario") {
                    filter("MEXFEDERALES");
                } else {
                    hideElementsByName(penitentiariesInput.value);
                }
            }
            removeSelectedFilter(filterInput.childNodes, "all");
            removeSelectedFilter(yearInput.childNodes, "year");




            filterInput.innerHTML = filterInput.innerHTML;
            yearInput.innerHTML = yearInput.innerHTML;
        }

        const handlerFilterInput = () => {
            if (stateInput.value != "Federales") {

                if(stateInput.value != "Seleccionar sistema.") {
                    hideElementsStateID(filterInput.value, simplemaps_countrymap_mapdata.state_specific[stateInput.value].name)
                } else {
                    hideElements(filterInput.value);
                }

            } else {
                hideElementsFederal(filterInput.value)
            }

            removeSelectedFilter(penitentiariesInput.childNodes, "Centro penitenciario");
            removeSelectedFilter(yearInput.childNodes, "year");




            yearInput.innerHTML = yearInput.innerHTML;
            penitentiariesInput.innerHTML = penitentiariesInput.innerHTML;
        }

        const handlerFilterYearInput = () => {
            if (stateInput.value != "Federales") {

                if(stateInput.value != "Seleccionar sistema.") {
                    hideElementsByYearStateID(yearInput.value, simplemaps_countrymap_mapdata.state_specific[stateInput.value].name)
                } else {
                    hideElementsByYear(yearInput.value);
                }
            } else {
                hideElementsByYearStateID(yearInput.value);
            }

            removeSelectedFilter(penitentiariesInput.childNodes, "Centro penitenciario");
            // removeSelectedFilter(filterInput.childNodes, "all");
            removeSelectedFilter(filterInput.childNodes, "all");




            filterInput.innerHTML = filterInput.innerHTML;
            penitentiariesInput.innerHTML = penitentiariesInput.innerHTML;
        }

        simplemaps_countrymap.hooks.back = () => {
            if (stateInput.value != "Federales") {
                // Filter all prisons and refresh
                filter()
                // Insert options elements of states
                insertOptionsElements(initialStates, stateInput);
                // Insert options elements of penitentiaries
                insertOptionsElements([], penitentiariesInput, "Centro penitenciario", true);
                // Update chart with initialStates has default data
                update(undefined, "Nacional");

                removeSelectedFilter(filterInput.childNodes);
                removeSelectedFilter(yearInput.childNodes, "year");
            }
        };
        simplemaps_countrymap.hooks.zoomable_click_state = (id) => {
            if (stateInput.value != "Federales") {
                // Add the selected attribute to the chosen option and remove the previous ones
                handlerStateInput(id);

                removeSelectedFilter(stateInput.childNodes, id);
                removeSelectedFilter(yearInput.childNodes, "year");
            } else {
                simplemaps_countrymap.state_zoom(id);
            }
        } ;

        // Events
        stateInput.addEventListener("change", handlerStateInput);
        penitentiariesInput.addEventListener("change", handlerPenitentiariesInput);
        filterInput.addEventListener("change", handlerFilterInput);
        yearInput.addEventListener("change", handlerFilterYearInput);
    };
}