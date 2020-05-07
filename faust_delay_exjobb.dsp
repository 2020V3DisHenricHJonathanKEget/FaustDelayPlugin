import("stdfaust.lib");

MAX_DELAY_TIME = 2000;
SAMPLE_RATE = ma.SR;

Xdelay = _ <: *(1-DryWet), (+~(de.fdelay(SAMPLE_RATE*2, Time)*Feedback) : *(DryWet)) :> _ 
with
{
  DryWet	= hslider("Dry/Wet", 0, 0, 1, 0.01) : si.smooth(0.999);
  Feedback	= hslider("Feedback", 0, 0, 1, 0.001) : si.smooth(0.999);
  Time		= hslider("Time (ms)", 250, 0, MAX_DELAY_TIME, 0.1) * 0.001 * SAMPLE_RATE : si.smooth(0.999);
};

process = Xdelay;
			