# 661-Final-Project
Deep Learning-Based Reconstruction of Sea Subsurface Temperature from Surface Climate Data

This project focuses on trying to reconstruct sea subsurface temperature (ST) from sea surface climate data using deep learning. Specifically, the input of the model will be sea surface temperature (SST), sea surface height (SSH), sea surface zonal wind (uSSW), sea surface meridional wind (vSSW), along with latitude (lat) and longitude (lon). The output of the model will be sea temperature (ST) at different depth.

<table>
  <tr>
    <td align="center">
      <img src="Visualizations/Sea_Surface_Height.png" alt="Sea Surface Height" width="200"><br>
      <strong>Sea Surface Height</strong>
    </td>
    <td align="center">
      <img src="Visualizations/Sea_Surface_Temperature.png" alt="Sea Surface Temperature" width="200"><br>
      <strong>Sea Surface Temperature</strong>
    </td>
  </tr>
  <tr>
    <td align="center">
      <img src="Visualizations/uSSW.png" alt="Sea Surface Zonal Wind" width="200"><br>
      <strong>Sea Surface Zonal Wind</strong>
    </td>
    <td align="center">
      <img src="Visualizations/vSSW.png" alt="Sea Surface Meridional Wind" width="200"><br>
      <strong>Sea Surface Meridional Wind</strong>
    </td>
  </tr>
</table>


We use an improvement upon LSTM fully connected layers and instead transforming them into a convolutional layer. This should improve the model’s spatial awareness because convolutional layers capture spatial hierarchy better than FC layers. Specifically, convolutional layers are more efficient in that they take advantage of spatial locality and thus have more sparse connections.

### Models
This section contains all the core machine learning and deep learning models used in the project. Each model is modularized into its own file within the `Models/` directory.

| File | Description |
|------|-------------|
| [Models/ConvLSTM_V1.ipynb](Models/ConvLSTM_V1.ipynb) | ConvLSTM using sigmoid and tanh activation |
| [Models/CONVLSTM_V2.ipynb](Models/ConvLSTM_V2.ipynb) | CONVLSTM using sigmoid and elu activation |