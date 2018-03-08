---
title: A Gentle Introduction to Bayesian Inference
author: Matt Espe
institute: UC-Davis Data Science Initiative
date: 9 Mar 2018
---

# Overview

## Background

+ What is Bayesian Inference
+ Why (not) Bayes
+ MCMC
+ Bayes in applied science

## Assumptions of this presentation

+ A very basic understanding of statistics and probability

+ No programming experience

+ No theoretical statistics/probability knowledge

# What is Bayesian Inference

## Bayesian Inference

Broadly speaking, Bayesian inference is a means to conduct statistical
inference based on Bayes' Theorem.

Bayes' Theorem states that the probability of an estimate is a
function of prior knowledge of that estimate and information provided
by data.

## Bayes Theorem

$$ P(A \mid B) = \frac{P(B \mid A) \, P(A)}{P(B)} $$

$P(A \mid B)$ is the **posterior**, the distribution of probable values
of parameter(s) A given data B.

$P(B \mid A)$ is the **likelihood**, the probability of seeing data B
given possible values of parameter(s) A.

$P(A)$ is the **prior**, the distribution of probable values of
parameter(s) A from prior study.

$P(B)$ is the **evidence**, acts as a normalizing constant.

## Bayes Theorem (cont)

$$ P(A \mid B) \propto P(B \mid A) \, P(A) $$

We typically work with this form, because we really only need to know
the posterior up to a proportion.

# Why (not) Bayes

## Why (not) Bayes? - background

Bayesian stats is becoming increasingly popular.

Many see it as the solution to the replication crisis, p-hacking,
researcher degrees of freedom, etc.

It is vogue.

## Why (not) Bayes?

However, Bayesian analysis cannot save you from yourself.

Every statistical "sin" possible using frequentist stats can be done
using Bayesian statistics.

There are fewer people qualified to review Bayesian methods, less help
available, fewer texts, etc.

It can be easy to get yourself into trouble. Many of the benefits are
"double-edged swords"

## So, why should you use Bayes?

+ Consistent: The solution to every problem is "apply Bayes theorem"

+ Flexible: With a simple framework, you can express many different
  types of models easily.

+ Forces you to write out the model:\* This makes it easier to make
  sure you are really testing what you think you are testing.

+ Priors are explicit in the model: Frequentist analyses often have
  implicit priors that are never known to anyone but the analyist.

+ Bayesian interpretations often align better with our expectations

\* *Increasingly not necessary*

## Example: Confidence intervals

I want to make a 50\% confidence interval for the mean of two
values,X~1~ and X~2~ using this method:
 
+ If X~1~ > X~2~, then the confidence interval is $-\infty$ to
  $\infty$

+ If X~1~ < X~2~, then the confidence interval is { } (an empty set).

Is this a valid 50\% confidence interval?

## Example: Confidence intervals

Yes, it is.

A confidence interval is an interval produced from a procedure that
results in intervals which contain the true value X\% of the time.

This method creates intervals which contain the true value 50\% of the time.

If this makes you uncomfortable, it is probably because what a
confidence interval actually is does not align with your expectations.

## Example: Credible interval

Credible interval\* is also an interval, but represents the interval
that contains X\% of the posterior probability.

The above example is not a credible interval because it either
contains 100\% of the posterior probability or none.

\* *I'm pretty sure Bayesian statisticians named it "credible interval" so they
could try to sneak the abbreviation CI by cranky reviewers.*

# Markov Chain Monte Carlo

## Markov Chain Monte Carlo (MCMC)

MCMC is the technology that makes Bayesian analysis practical

The use of Bayesian analysis "took off" when computational power was
available to run MCMC algorithms.

## Conceptual exercise: Measuring campus

Thought experiment: We want to measure the vertical height for all of
UC Davis Campus.

We want a "map" with the height above ground (building roofs) for every X,Y coordinate

## Best case - known properties

Imagine that every construction on campus followed a set of standards. 

A few numbers (e.g., number of floors) tells you all the other
properties of the construction (height, footprint size, etc.).

We can make our map knowing a handful of numbers.

But, not many areas are like this... for complicated cases, we need
something else.

## Grid survey

We can walk along campus on a grid, measuring height at set X,Y
points to construct our map.

A large grid size will be faster to complete, but more uncertainty
between the sample points.

A small grid size will take a while to complete, but we are more
certain about how campus changes between the points.

We might spend a lot of time in areas that are not interesting (e.g., the
soccer fields)

We need to be able to measure the height exactly.

## Random walk

So, what can we do without measuring exactly?

Maybe instead, we walk randomly through campus, recording where we
have been.

+ Some locations we will visit multiple times.

+ Some locations we will never visit.

+ At a long enough time-interval, we will see everything.

But...

## Random walk (cont)

+ We still spend a lot of time surveying areas with very little change
  (e.g., the soccer fields)
  
+ We still need to measure the height

This does not quite work... without another piece, it is just a
really inefficient grid survey.

## Metropolis-Hastings

What if the number of times we visit a location was an indication of
that location's height?

Then we can use the history of our walk to determine the heigh of the
buildings.

## Metropolis-Hastings (cont)
What would this look like?

1. From a starting place, you decide to walk in a random direction for
   a random distance.

1. Before you move, you look at where you will walk. You evaluate the
   new locations height relative to your current position.  

1. You will move to that new location with a probability related to
   the difference in heights.
   + You will be more likely to move to a location with a height more than your
	 current location
   + You are less likely (but might still move) to a location with
     height less than your current location
	 
## Metropolis-Hastings (cont)

The number of times you visit a location will be proportional to that
location's relative height! 

You only need to evaluate the relative heights, not exact heights.

You will spend relatively little time exploring areas with low
heights. 

Your search will focus on the areas where there are
buildings.

## Metropolis-Hastings (cont)

Metropolis-Hastings give us a way to approximate a complex
distribution without having to be able to exactly measure it. We only
need relative probability density/mass. 



## Gibbs sampling

Jumping in a random direction might not be efficient. If you are on
top of a building you want to explore, you might want to restrict your
movement.

What if you only moved in one direction at a time? Instead of randomly
picking a direction AND a distance, you have a set direction
(alternating between for example N-S and E-W) and only randomly pick a distance.

## Hamiltonian Monte Carlo







