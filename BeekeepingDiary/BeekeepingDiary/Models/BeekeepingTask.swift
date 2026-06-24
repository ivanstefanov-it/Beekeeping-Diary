import SwiftData
import Foundation

@Model
class BeekeepingTask: Identifiable {
    var id = UUID()
    
    var title: String
    var notes: String?
    
    var type: TaskType
    
    var dueDate: Date?
    
    var status: TaskStatus
    var priority: TaskPriority
    
    var createdAt: Date
    var completedAt: Date?
    
    var apiary: Apiary?
    var hive: Hive?
    
    enum TaskType: String, Codable, CaseIterable, Identifiable {
        case inspection = "Inspection"
        case feeding = "Feeding"
        case treatment = "Treatment"
        case queenReplacement = "Queen replacement"
        case addSuper = "Add super"
        case harvestHoney = "Harvest Honey"
        case migration = "Migration"
        case custom = "Custom"
        
        var id: Self { self }
    }
    
    enum TaskStatus: String, Codable, CaseIterable, Identifiable {
        case pending = "Pending"
        case completed = "Completed"
        case cancelled = "Cancelled"
        
        var id: Self { self }
    }
    
    enum TaskPriority: String, Codable, CaseIterable, Identifiable {
        case low = "Low"
        case medium = "Medium"
        case high = "High"
        
        var id: Self { self }
    }
    
    init(
        id: UUID = UUID(),
        title: String,
        notes: String? = nil,
        type: TaskType,
        dueDate: Date?,
        status: TaskStatus,
        priority: TaskPriority,
        createdAt: Date,
        completedAt: Date? = nil,
        apiary: Apiary? = nil,
        hive: Hive? = nil
    ) {
        self.id = id
        self.title = title
        self.notes = notes
        self.type = type
        self.dueDate = dueDate
        self.status = status
        self.priority = priority
        self.createdAt = createdAt
        self.completedAt = completedAt
        self.apiary = apiary
        self.hive = hive
    }
}
