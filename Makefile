# Makefile for MassiveBank Risk Analysis

DOWNLOAD_URL := https://raw.githubusercontent.com/IgorTodorovskiIBM/podman_example/main/data.txt
DOWNLOAD_DEST := data.txt
RISK_ANALYSIS_FILE := risk_analysis.txt

.PHONY: all clean clone_repo download run_perl generate_pax risk_analysis

all: clean clone_repo download run_perl generate_pax risk_analysis

download:
	@echo "Downloading data file using curl..."
	curl -o $(DOWNLOAD_DEST) $(DOWNLOAD_URL)
	@echo "Data file downloaded to: $(DOWNLOAD_DEST)"

run_perl:
	@echo "Running Perl scripts on data..."
	perl process_data.pl $(DOWNLOAD_DEST) >> $(RISK_ANALYSIS_FILE)

risk_analysis: $(RISK_ANALYSIS_FILE)

$(RISK_ANALYSIS_FILE): download run_perl
	@echo "Risk analysis generated in: $(RISK_ANALYSIS_FILE)"

clean:
	@echo "Cleaning up..."
	rm -rf $(REPO_DIR) $(DOWNLOAD_DEST) $(RISK_ANALYSIS_FILE)
	@echo "Cleanup complete."

