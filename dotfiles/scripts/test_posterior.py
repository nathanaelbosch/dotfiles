sensitivity = 1  # Correct if sick; Given by the test
specificity = 0.998  # Correct if not sick; Given by the test
infected = 300_000  # Overestimation on the current (12.05.2020) numbers in Germany
population = 83_200_000  # German population


def posterior(sensitivity, specificity, infected, population):
    return (
        sensitivity
        * (infected / population)
        / (
            sensitivity * (infected / population)
            + (1 - specificity) * (1 - infected / population)
        )
    )


p = posterior(sensitivity, specificity, infected, population)
print(f"Posterior: {p*100:.2f}%")
