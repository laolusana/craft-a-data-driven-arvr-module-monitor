pragma solidity ^0.8.0;

/**
 * @title Craft A Data-Driven AR/VR Module Monitor
 * @author [Your Name]
 * @notice A data-driven AR/VR module monitor that tracks module performance and provides real-time insights
 * @dev This contract is designed to work with AR/VR modules and track their performance in real-time
 */

contract CraftARVRModuleMonitor {
    // Mapping of module IDs to their corresponding performance data
    mapping (uint256 => ModulePerformance) public modulePerformances;

    // Event emitted when new performance data is added for a module
    event NewPerformanceData(uint256 moduleId, uint256 timestamp, uint256 fps, uint256 latency);

    // Struct to represent module performance data
    struct ModulePerformance {
        uint256 timestamp; // Timestamp of the performance data
        uint256 fps; // Frames per second
        uint256 latency; // Latency in milliseconds
    }

    /**
     * @dev Add new performance data for a module
     * @param _moduleId ID of the module
     * @param _timestamp Timestamp of the performance data
     * @param _fps Frames per second
     * @param _latency Latency in milliseconds
     */
    function addPerformanceData(uint256 _moduleId, uint256 _timestamp, uint256 _fps, uint256 _latency) public {
        modulePerformances[_moduleId] = ModulePerformance(_timestamp, _fps, _latency);
        emit NewPerformanceData(_moduleId, _timestamp, _fps, _latency);
    }

    /**
     * @dev Get the performance data for a module
     * @param _moduleId ID of the module
     * @return The performance data for the module
     */
    function getPerformanceData(uint256 _moduleId) public view returns (ModulePerformance memory) {
        return modulePerformances[_moduleId];
    }

    /**
     * @dev Get the average FPS for all modules
     * @return The average FPS for all modules
     */
    function getAverageFPS() public view returns (uint256) {
        uint256 totalFPS = 0;
        uint256 count = 0;
        for (uint256 moduleId = 0; moduleId < modulePerformances.length; moduleId++) {
            if (modulePerformances[moduleId].timestamp > 0) {
                totalFPS += modulePerformances[moduleId].fps;
                count++;
            }
        }
        return totalFPS / count;
    }

    /**
     * @dev Get the average latency for all modules
     * @return The average latency for all modules
     */
    function getAverageLatency() public view returns (uint256) {
        uint256 totalLatency = 0;
        uint256 count = 0;
        for (uint256 moduleId = 0; moduleId < modulePerformances.length; moduleId++) {
            if (modulePerformances[moduleId].timestamp > 0) {
                totalLatency += modulePerformances[moduleId].latency;
                count++;
            }
        }
        return totalLatency / count;
    }
}