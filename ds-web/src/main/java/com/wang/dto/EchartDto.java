package com.wang.dto;

import java.util.List;
import java.util.Map;

/**
 * Created by wxl on 2016/5/25.
 */
public class EchartDto {
    private List<String> legendData;
    private List<Map<String,Object>> seriesData;

    public EchartDto(List<String> legendData, List<Map<String, Object>> seriesData) {
        this.legendData = legendData;
        this.seriesData = seriesData;
    }

    public List<Map<String, Object>> getSeriesData() {
        return seriesData;
    }

    public void setSeriesData(List<Map<String, Object>> seriesData) {
        this.seriesData = seriesData;
    }

    public List<String> getLegendData() {
        return legendData;
    }

    public void setLegendData(List<String> legendData) {
        this.legendData = legendData;
    }
}
