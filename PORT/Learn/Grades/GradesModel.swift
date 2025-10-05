struct ResponseData: Codable {
    let edu: String
    let stage: String
    let Resuit: String
    let roletype: String
    let evaluation: String
    let system_type: String
    let materialsWithType: [MaterialsWithType]
    
    enum CodingKeys: String, CodingKey {
        case edu, stage, Resuit, roletype, evaluation, system_type
        case materialsWithType = "Materials_with_type"
    }
}

struct MaterialsWithType: Codable {
    let type: String
    let studentMaterials: [StudentMaterial]
    
    enum CodingKeys: String, CodingKey {
        case type
        case studentMaterials = "student_materials"
    }
}

struct StudentMaterial: Codable {
    let material: String
    let isCarry: Bool
    let fulfilled: Bool
    let appreciation: String?
    
    enum CodingKeys: String, CodingKey {
        case material = "Material"
        case isCarry = "is_carry"
        case fulfilled
        case appreciation = "Appreciation"
    }
}
