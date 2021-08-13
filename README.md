# Advanced Signal Processing Techniques



This repository contains the assignments for the Academic Course "Advanced Signal Processing Techniques" taught in the Spring of 2018-2019 in Aristotle University of Thessaloniki - Electrical & Computer Engineering.  

The aim of 1st the project is the familiarization with **Higher Order Statistics (Spectra)** and **Autoregressive Moving Average (ARMA)** models.  

In the 2nd project the following **Time Frequency Analysis (TFA)** techniques are implemented in <ins>ECG (Electrocardiography)</ins> signals:

1. Short Time Fourier Transform (**STFT**)
2. Wavelet Transform (**WT**) with different wavelet families
3. Hilbert–Huang Transform (**HHT**) with Empirical Mode Mecomposition (EMD) or Ensemble EMD (EEMD)

The differences and advantages of each method were examined and applied to detect different points of interest (PVC or APC beats, isolated beats, sinus arrhythmia and other) for each cardiogram. Furthermore, R-R intervals in Frequency Domain were calculated with HHT method.



## 1st Project - MA models



The aim of 1st the project is the familiarization with **Higher Order Statistics (Spectra)** and **Autoregressive Moving Average (ARMA)** models. A discrete signal x[k] is created as an output of a q=5th order Moving Average (**MA-5**) process. The coefficients are b=[1.0, 0.93, 0.85, 0.72, 0.59, −0.10].  The input of our linear system is a  non-Gaussian white noise. An exponential distribution with mean value equal to 1 is used in order to create the v[k] signal. 

v=exprnd(1,[1,2048]);



In the below picture, the system is illustrated. 

<p allign = "center">
     <img src="/photos/1.png"width = "45%">
</p>


We will continue with the estimation of the the 3rd order cumulant. In order to estimate the 3rd order cumulant of x[k], we use the indirect method  with K = 32, M = 64 και L3 = 20. 



For the indirect method:

1. We segment the data into K records of M samples each, i.e., N = KM.

2.  After that we subtract the average value of each record.

3. We obtain an estimate of the third-moment sequence:

   <p allign = "center">
        <img src="/photos/2.png"width = "50%">
   </p>

   where i = 1, 2, ..., K 

   s1 = max(0, -m, -n)

   s2 = min(M-1, M-1-m, M-1-n)

4. Obtain the 3-rd order cumulant by averaging r_i(m, n) over all segments

   <p allign = "center">
        <img src="/photos/3.png"width = "42%">
   </p>

Below we can see the 3-rd order cumulant graphically illustrated. 

<p allign = "center">
     <img src="/photos/4.png"width = "70%">
</p>

### Giannakis Formula

An MA model has a finite impulse response (FIR) and **Giannakis** was the first to show that the Impulse Response of a qth-order MA system can be calculated just from the system’s output cumulants using the following simple closed-form formula (stated here in terms of third-order cumulants). 

<p allign = "center">
     <img src="/photos/5.png"width = "45%">
</p>

Note, this formula requires exact knowledge of MA order q.  It may be impractical from an actual computation point of view because the output cumulant must be estimated, and does not provide any filtering to reduce the effects of cumulant estimation errors. 

**<ins>q'=q=5</ins>**

Using the exact order of the system q=5, we estimate the Impulse Response of the system ℎ̂[𝑘]  and the output of the system: 

𝑥_𝑒𝑠𝑡[𝑘] = 𝑣[𝑘] ∗ ℎ̂[𝑘] 

Below we can see graphically illustrated the estimated output 𝑥_𝑒𝑠𝑡[𝑘] (red) and the original 𝑥_[𝑘] (blue) in the same figure.

<p allign = "center">
     <img src="/photos/6.png"width = "90%">
</p>

We notice that the result is quite encouraging and that the estimation with Giannakis formula follows the original signal 𝑥_[𝑘]. The peaks of the estimation are slightly bigger. 



Using the below formula for the Normalised Root Mean Square Error- NRMSE 

<p allign = "center">
     <img src="/photos/NRMSE.png"width = "40%">
</p>
where 

<p allign = "center">
     <img src="/photos/RMSE.png"width = "40%">
</p>

we get NRMSE=0.1202



We will continue our experiments in order to examine the Giannakis' formula with over- and under-estimation of the order q. We are going to calculate the IR and estimate our output signal x[k] for q'=q-2 and q='q+3 in order to see the effect of the error.



**<ins>q'=q-2</ins>**

<p allign = "center">
     <img src="/photos/7.png"width = "90%">
</p>



**<ins>q'=q+3</ins>**

<p allign = "center">
     <img src="/photos/8.png"width = "90%">
</p>



In the below table the NRMSE for each case is summarized after repeating the above process 100 times and taking the mean value of the metric.

|     ~     |  q'=q  | q'=q-2 | q'=q+3 |
| :-------: | :----: | :----: | :----: |
| **NRMSE** | 0.1284 | 0.1187 | 0.1334 |

We can observe from the respective diagrams as well as from the above table that the under-estimation of the q-th order of the system has given the best results from the above experiments. The green  color (under-estimation of q) is quite near to the original signal for all samples in comparison to the yellow (over-estimation of q) which is shifted upwards and lead to a high NRMSE. 

We are going to proceed with the examination of the effect of the SNR in the exact estimation of the order of the system q=5.  We add a source of white Gaussian noise in the output of the system (awgn.m matlab function is used), creating a change in the signal-to-noise ratio (SNR) [30: - 5: -5] dB, i.e., 𝑦𝑖 [𝑘] = 𝑥 [𝑘] + 𝑛𝑖 [𝑘], 𝑖 = 1: 8. We will use again Giannakis formula and estimate the output signals once again. 



Our new system can bee seen below: 

<p allign = "center">
     <img src="/photos/9.png"width = "50%">
</p>

Below we can see all x-estimations using subplot in Matlab. The user can also select to plot them separately through a single interactive menu.

<p allign = "center">
     <img src="/photos/11.png"width = "95%">
</p>



This is the plot of the NRMSE error as a function of SNR: 

<p allign = "center">
     <img src="/photos/10.png"width = "70%">
</p>



We can see that the NRMSE decays exponentially as the SNR increases and reaches quite low values for the NRMSE. 



### Conclusions

Giannakis formula requires exact knowledge of MA order q and it may be impractical from an actual computation point of view because the output cumulant must be estimated, and does not provide any filtering to reduce the effects of cumulant estimation errors.  Though as we see, the effect of the over- or under- estimation of the order of the system does not lead to quite worse results in comparison to the exact order. Therefore the formula can be used for an intuitive estimation. For high SNRs the accuracy is great and the NRMSE tends to decay completely.

### Execution

Running the script ex2.m calls all the respective scripts in a row and prints respective messages to the console using a single interactive menu.





## 2nd Project - Time Frequency Analysis in ECG signals



In the 2nd project different **Time Frequency Analysis (TFA)** techniques are implemented in ECG (Electrocardiography) signals. The following techniques were implemented for the analysis of 5 signals from <ins>MIT-BIH Arrhythmia Database of Physionet. </ins>

1. Short Time Fourier Transform (**STFT**)

   The spectrogram helps us to see in what order the frequencies are appeared in time, unlike the simple Fourier Transform. The signal is separated in many pieces of an equal number of samples and Fourier Transform is applied to each one of them. The results are represented in the spectrogram. The size of the window that the signal is separated plays an important role. If the window is big enough then will not be able to see how the frequency changes over time, if it is small enough we will have great accuracy in how frequency changes over time, however, without having a good picture for which frequencies are concerned. Therefore, based on these, we must choose wisely the corresponding window size to apply to STFT. Of course this depends on both the number of samples of the signal, and the frequencies that contains our signal, from the sampling frequency but also where we want to emphasize to, discreet in frequency or time.
   
   

2. Wavelet Transform (**WT)** with different wavelet families

   Wavelets are functions that you can use to decompose signals. Note that wavelets are of signals of a limited duration and zero average value. Just as the Fourier transform decomposes a signal into a family of complex sinusoids, the wavelet transform decomposes a signal into a family of wavelets. Unlike sinusoids, which are symmetric, smooth, and regular, wavelets can be either symmetric or asymmetric, sharp or smooth, regular or irregular. This is the advantage that gives us better discretion over time, as we can to shift the wavelet (shifting) in the time domain. In terms of frequency, we can change the scale of a the wavelet in our signal. The higher the "magnification" - scale, the lower we go in frequency. Wavelet signal processing is different from other signal processing methods because of the unique properties of wavelets. For example, wavelets are irregular in shape and finite in length. Wavelet signal processing can represent signals sparsely, capture the transient features of signals, and enable signal analysis at multiple resolutions. This results in good discretion in time and frequency simultaneously. There are many families of wavelets with different properties that we can choose based on the format of our signal.

1. Hilbert-Huang Transform (**HHT**) , with Empirical Mode Decomposition (EMD) or Ensemble EMD (EEMD)

The Hilbert-Huang transform is a method that decomposes the signal of fragmenting the original signal in individual functions, the so-called Endogenous Rhythm Functions (Intrinsic Mode Functions - IMFs) with the ultimate goal of getting information about the instantaneous frequencies of our signal. Thus, in contrast to transformation Fourier which breaks the signal into individual oscillations (sines and cosines) of constant amplitude and frequency, HHT fragments the signal into variable amplitude and frequency functions. These individual functions have narrow bandwidth, the narrower the better, while they must meet some conditions:

- The number of their extremes should be the same as the number of zero points or differ by a maximum of 1

- The average value of the upper and lower envelope should be zero

This transformation is mainly based on the Empirical Mode method Decomposition, which essentially separates the signal into IMFs. The functions in the resulting order, have initially high frequencies, while as moving on to the later IMFs, these contain lower frequencies. Thus, the EMD method is an easy-to-use tool for rejecting signal noise various applications.



Our goal in choosing signals from the database was to cover a wide range of characteristics of a cardiogram. We selected patients with different characteristics but at the same time with common "abnormalities" in the ECG so that we can compare them using the methods.

**Selected ECG** signals and their characteristics below: 

<p allign = "center">
     <img src="/photos/database.png"width = "90%">
</p>



The sampling frequency of our signals is 360 Hz, ie every 2.78 msec we have sample. To isolate the points of interest we cut the signal ± 10 sec from the corresponding time we find in the database.

For demonstrative purposes we will only show some specific points of interest and use the above techniques. 

Point of interest, **Premature ventricular contractions (PVC**):

<p allign = "center">
     <img src="/photos/pvc.png"width = "90%">
</p>



We see the result of the **STFT**, using Hamming window: 

<p allign = "center">
     <img src="/photos/stft_pvc.png"width = "90%">
</p>

We observe a strong accumulation of energy at very low frequencies - below 5 Hz throughout the duration of the signal. The image below shows the normalized energy in terms of the frequencies involved in an ECG. We confirm that low frequencies contain the maximum energy signal . 



<p allign = "center">
     <img src="/photos/norm_energy.png"width = "70%">
</p>

At the corresponding time we see the absence of the yellow stripe that causes arrhythmia and time-frequency domain non-uniformity. In addition the main frequency appears to be 60 Hz throughout the signal, which of course is the interferecne of the ECG circuit.



At this point we will apply the **Wavelet Transform** to examine further which frequencies are involved in PVC. We choose the family symlets, and specifically <ins>symlet 6</ins>  with the following characteristics.

<p allign = "center">
     <img src="/photos/wavelet_scaling_functions.png"width = "70%">
</p>

 The function φ(t) is responsible for the approximation while ψ(t) is responsible for the details. <ins>We choose this particular wavelet as it resembles the PQRST of the heart, which is repeated on the ECG.</ins>



Below we can see the Wavelet Transform of the same signal.

<p allign = "center">
     <img src="/photos/wavelet_transform.png"width = "90%">
</p>

The signal results from the sum of the approximation and the detailed levels. The signal decomposes into different frequency bands. We chose 6 levels (6 detailed coefficients). The more levels the more different bands. The resulting frequencies for each diagram follow the Niquist criterion . The lower diagrams determine the finer details as they represent higher frequencies as shown right in the image in the red font. The amplitude of the last  diagram [high frequency] is quite small, it is basically noise and can be ignored. This is another advantage of the Wavelet Transform, which is widely used in signal denoising on cardiograms. We can observe an unusual activity in time that PVC takes place, with significant width in the approximation level, ie in the band of (0 - 5.62 Hz) and in the first 2 levels with a smaller width. That is, we have participation of the frequencies of the 3rd first diagrams with the most intense the 1st band. The higher level that we choose to decompose our signal and split it into different freq. bands, the finer resolution in frequency we get with the Wavelet Transform, which has a lot to offer in signal processing.

We will apply the Wavelet Transform again for the PVC point of interest, this time with a different family of wavelets. We select the wavelet Daubechies 4 (db4) with the following features:



<p allign = "center">
     <img src="/photos/functions_daubechies.png"width = "70%">
</p>



The result for 6 Level WT can be seen below. 

<p allign = "center">
     <img src="/photos/wavelet_transform_2.png"width = "90%">
</p>



With this daubechies wavelet, we observe that the amplitude of the first 3 plots is bigger in comparison to symlets family, the time that PCV takes place. The amplitude of the latter frequency bands remain almost the same. It is very easy to observe the abnormality of the diagram based on this 6-level decomposition and see which low frequencies contain the biggest energy for the PVC. 





We move on with the Hilbert-Huang Τransfom for a APC beat point of interest. In **Premature Atrial Contraction (APC)** P wave appears prematurely before the previous cycle with the T wave. Below we can see such cases in ECG signal.



<p allign = "center">
     <img src="/photos/apc_signal.png"width = "70%">
</p>



Below we can see a detailed plot of all 7 IMFs, from high to low frequencies, as well as the gradual elimination of noise.



<p allign = "center">
     <img src="/photos/HHT.png"width = "100%">
</p>



It is worth mentioning that in the detailed plots of the IMFs, the one that seems to have greater intensity is the latter, i.e. the plot that contains the range of low frequencies. This is because, as we saw above,  Premature Atrial Contraction creates such an abnormality in waveform, that it exhibits momentarily low-frequency behavior.



### RR Intervals in Frequency Domain



In order to locate RR intervals we first had to decide which ones method we would try to locate the peaks of the pulses. Along the way of the work we observed that the HHT-EMD method offered a better resolution in both time and frequency, without burdening the execution. That is why we chose to move on with this method. Initially we chose a very narrow window in time (15 samples), as after observation we saw that in the HH spectrum each pulse lasted about 30 samples, so with one window size about half we would always manage to catch a large part of the spectral content of each pulse. With this window we scanned the entire signal in time and added up the energy of all the frequencies which contained. So, we calculated a suitable threshold in order to distinguish the R wave from the intermediate content. In order to avoid the noise content of the signal we rejected the first IMF and we used the 2nd, since it had a smaller bandwidth, less noise, but at the same time it maintained high energy levels, so we could easily distinct the desired information from any intermediate noise. After we located the spikes, we select the middle sample of the window as the final location of the pulse. Here we noticed that the vals vector where we stored the estimated Spikes had longer length than the annotation vector  which contained the actual positions of the pulses. So we applied a check for double spikes, resetting one of each two peaks that we had located at a distance closer than 20 samples. Finally, in order to compare the estimated positions with the real ones, we calculated the average distance in samples from the real spikes, the number of pulses we finally managed to detect, as well as the Root Mean Square Error of the sample distance.



|   Signal number    |    100    |    113    |    115    |    117    |    119    |
| :----------------: | :-------: | :-------: | :-------: | :-------: | :-------: |
| **correct pulses** | 2261/2381 | 1615/1808 | 1777/2137 | 1488/1740 | 1416/2153 |
|  **total pulses**  |   2274    |   1796    |   1962    |   1539    |   2094    |
|      **RMSE**      |   6.15    |   8.60    |   9.87    |   7.02    |   7.20    |
| **mean_distance**  |   4.46    |   5.31    |   7.36    |   4.56    |   4.43    |

We observe that the RMSE are in all cases quite encouraging. Actually, if we assign this to seconds it is less than 27.8 msec from the actual R interval. Correct pulses are close to the total vertices with great precision. On the other hand we have an overstimation of spikes in all ECG signals. That means that our choice for the threshold is poor and we need to use a different method to determine a better threshold. Notice that in signal 119 contains a lot of noise, many isolated beats as well as ventricular bigeminy or trigeminy. As a consequence we have a poor accuracy in this ECG.  
