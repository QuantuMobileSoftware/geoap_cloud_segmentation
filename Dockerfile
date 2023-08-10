FROM tensorflow/tensorflow:2.11.0-gpu

# Needed for geopandas, shapely & GDAL to work
RUN add-apt-repository ppa:ubuntugis/ppa

RUN apt-get update && apt-get install build-essential -y

RUN apt-get update && \
    apt-get install -y \
    gdal-bin\
    libgdal-dev\
    git \
    libspatialindex-dev \
    libgl1-mesa-glx \
    libexpat1-dev \
    libgraphicsmagick++1-dev \
    libcppunit-dev \
    cmake \
    gcc-9 \
    g++-9
    
RUN mkdir /code

WORKDIR /code
COPY ./ .

RUN pip install -r requirements.txt
RUN pip install cget

# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

WORKDIR /code/cm-vsm/vsm/build
RUN cget install
RUN cmake .. -DCMAKE_CXX_COMPILER=g++-9
RUN make
RUN make install

CMD ["jupyter", "nbconvert", "--inplace", "--to=notebook", "--execute", "./Cloud.ipynb"]
