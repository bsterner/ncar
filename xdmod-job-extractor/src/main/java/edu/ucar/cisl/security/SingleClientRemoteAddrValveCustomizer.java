package edu.ucar.cisl.security;

import org.apache.catalina.valves.RemoteAddrValve;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
import org.springframework.stereotype.Component;

@Component
public class SingleClientRemoteAddrValveCustomizer implements EmbeddedServletContainerCustomizer {

    private static final String LOOPBACK_ADDRESS_RX = "127\\.\\d+\\.\\d+\\.\\d+|::1|0:0:0:0:0:0:0:1";

    private String clientIpAddressRx = LOOPBACK_ADDRESS_RX;

    @Override
    public void customize(ConfigurableEmbeddedServletContainer container) {
        TomcatEmbeddedServletContainerFactory tomcatContainer =
                (TomcatEmbeddedServletContainerFactory) container;
        RemoteAddrValve remoteAddrValve = new RemoteAddrValve();
        remoteAddrValve.setAllow(clientIpAddressRx);
        tomcatContainer.addContextValves(remoteAddrValve);
    }
//
//    @Value("${client.ipaddress}")
//    public void setClientIpAddressRx(String clientIpAddressRx) {
//        if (StringUtils.isNotBlank(clientIpAddressRx)) {
//            this.clientIpAddressRx = clientIpAddressRx;
//        }
//    }
}