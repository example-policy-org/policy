#!/usr/bin/env bats

@test "checkov" {
for dir in infra/checkov/*/ ; do
  for passing in ${dir}pass*.tf ; do
    # @test "Passing: ${passing}" {
      echo "Passing: ${passing}"
      checkov --config-file infra/checkov/config.yaml -f ${passing} --external-checks-dir ${dir}
    # }
  done
  for failing in ${dir}fail*.tf ; do
    # @test "Failing: ${failing}" {
      echo "Failing: ${failing}"
      ! checkov --config-file infra/checkov/config.yaml -f ${failing} --external-checks-dir ${dir}
    # }
  done
done
}