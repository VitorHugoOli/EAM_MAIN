import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'dart:html' as html;

class References extends StatelessWidget {
  const References({Key? key}) : super(key: key);

  _onTapLink(String? url,title) {
    if (url != null) {
      html.window.open(url, title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.all(20), child: Markdown(
          onTapLink: (text, href, title) => _onTapLink(href,title),
          extensionSet: md.ExtensionSet(
            md.ExtensionSet.gitHubFlavored.blockSyntaxes,
            [
              md.EmojiSyntax(),
              ...md.ExtensionSet.gitHubFlavored.inlineSyntaxes,
            ],
          ),
          softLineBreak: true,
          shrinkWrap: true,
          data: """
# Overview
This notebook intends to create a model that can be used to predict the concentration of microplastics, given the latitude, longitude, u, v, ug, vg ans number of microplastic samples. 

For this your group will create a model, to predict the concentration of microplastics.

## Data Explanation
The data using in this notebook was obtained from the [EARTHDATA](https://gpm.gsfc.nasa.gov/data/).
And all data was provide in the form of a netCDF file.

### **Ocean Currents**
This dataset describes the ocean currents at the surface of the Earth, between 01/01/1993 and 01/01/2021.

Link to the dataset: [Ocean Surface Current Analyses Real-time](https://search.earthdata.nasa.gov/search/granules?p=C2098858642-POCLOUD&pg[0][v]=f&pg[0][gsk]=-start_date&tl=1648086157.373!3!!&fs10=Ocean%20Currents&fsm0=Ocean%20Circulation&fst0=Oceans)

Documentation: [Ocean Currents](https://podaac-tools.jpl.nasa.gov/drive/files/allData/oscar/L4/oscar_v2.0/docs/oscarv2guide.pdf)

Download: [Ocean Currents](https://search.earthdata.nasa.gov/downloads/5030564349)

#### **Columns**
- **v:**
  Northward sea water velocity (m/s).

- **vg:**
  Geographic Northward sea water velocity (m/s).

- **u:**
  Eastward sea water velocity (m/s).
  
- **ug:**
  Geographic Eastward sea water velocity (m/s).


#### **Ranges**
The data covers -89.75° to 89.75° latitude and 0° to 359.75° longitude
01/01/1993 and 01/01/2021.

#### **Usage Ranges**
For the work we usage the range of -37° to 37° latitude and 0° to 359.75° longitude and 2018/01 to 2018/04.


### **Microplastics**
This dataset describes the concentration of microplastics in the ocean.

Link to the dataset: [CYGNSS L3 Ocean Microplastic Concentration V1.0](https://search.earthdata.nasa.gov/search/granules/collection-details?p=C2142677420-POCLOUD&pg[0][v]=f&pg[0][gsk]=-start_date&tl=1648079405.876!3!!&fsm0=Water%20Quality&fst0=Oceans)

Documentation: [Microplastics Doc](https://podaac-tools.jpl.nasa.gov/drive/files/allData/cygnss/L3/docs/148-0402-1_L3_Microplsatic_ATBD_Released.pdf)

Data Description: [Microplastics Data Description](https://podaac-tools.jpl.nasa.gov/drive/files/allData/cygnss/L3/docs/148-0401-2_L3_Microplastic_netCDF_Data_Dictionary.xlsx)

Download: [Microplastics Data](https://search.earthdata.nasa.gov/downloads/9368584333)

#### **Columns**
- **MP_concentration(Microplastic Concentration):**
  Near-surface ocean microplastic number density geometrically averaged over the 1 x 1 degree cell centered on lat and lon and averaged over one month centered on Timestamp, as derived from anomalies in CYGNSS L2 MSS samples.

- **stdev_MP_samples(Geometric standard deviation of microplastic concentration samples within spatiotemporal bin):**
  The geometric standard deviation of the individual samples of microplastic concentration geometrically averaged together to produce the monthly 1x1 deg L3 gridded product.

- **num_MP_samples(Number of microplastic concentration samples within spatiotemporal bin):**
  The number of individual samples of microplastic concentration geometrically averaged together to produce the monthly 1x1 deg L3 gridded product.

#### **Ranges**
The data covers -37° to 37° latitude and 0° to 359.75° longitude
The data covers the dates between 02/04/2017 and 25/09/2018

#### **Usage**
For the work we usage the range of -37° to 37° latitude and 0° to 359.75° longitude and 2018/01 to 2018/04.

        """)),
    );
  }
}
