<?xml version="1.0" encoding="utf-8"?>
<asdf>

  <header>
    <name>Virtual reproduction setup</name>
    <description>
      This scene creates the virtual source array surrounding the listener for tracking
      as the reproduction setup of a second SSR instance.
    </description>
  </header>

  <reproduction_setup>
    <circular_array number="64">
      <first>
        <!-- about 1 meter diameter -->
        <position x="0.5" y="0"/>
        <orientation azimuth="-180"/>
      </first>
    </circular_array>
  </reproduction_setup>
  
</asdf>
